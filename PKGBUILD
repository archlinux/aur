# Maintainer: Alrii14344 <alrii14344@gmail.com>
# Maintainer: Kohei Suzuki <eagletmt@gmail.com>

pkgname=gce-compute-image-packages
pkgver=0.0.0
pkgrel=1
pkgdesc='Linux Guest Environment for Google Compute Engine'
arch=('x86_64')
url='https://github.com/GoogleCloudPlatform/compute-image-packages'
license=('Apache')
depends=('python-boto' 'python-setuptools' 'git')
source=("$pkgname"::'git://github.com/GoogleCloudPlatform/compute-image-packages.git')
# Because the sources are not static, skip Git checksum:
sha512sums=('SKIP')

package() {
  cd "gce-compute-image-packages"

  python setup.py install --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/lib/systemd/system"
  for unit in google_compute_engine_init/systemd/*.service
  do
    install -m644 "$unit" "$pkgdir/usr/lib/systemd/system/"
  done
}