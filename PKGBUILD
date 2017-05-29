# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=gce-compute-image-packages
pkgver=20170523
pkgrel=1
pkgdesc='Linux Guest Environment for Google Compute Engine'
arch=('any')
url='https://github.com/GoogleCloudPlatform/compute-image-packages'
license=('Apache')
depends=('python-boto')
makedepends=('python-setuptools')
source=("https://github.com/GoogleCloudPlatform/compute-image-packages/archive/${pkgver}.tar.gz")

package() {
  cd "compute-image-packages-$pkgver"

  python setup.py install --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/lib/systemd/system"
  for unit in google_compute_engine_init/systemd/*.service
  do
    install -m644 "$unit" "$pkgdir/usr/lib/systemd/system/"
  done
}

sha512sums=('f72f46b962ef58b5d89a7eff0aff0abc3bb41fe33fd5fff0d8c2b2c08110f73316ed7fb0b6c9ea9c0c9a24760877a2b3da8facca81c15a47829b7a1af6bb2fd0')
