# Maintainer: Samuel Littley <samuel.littley@toastwaffle.com>

pkgname=python2-google-compute-engine-git
pkgver=e725e85
pkgrel=1
pkgdesc='Linux Guest Environment for Google Compute Engine - Python 2'
arch=('x86_64')
url='https://github.com/GoogleCloudPlatform/compute-image-packages'
license=('Apache')
depends=('python2-boto' 'python2-setuptools')
makedepends=('git')
source=('git://github.com/GoogleCloudPlatform/compute-image-packages.git')
# Because the sources are not static, skip Git checksum:
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/compute-image-packages"
  echo "$(git describe --always |sed "s#${_pkgname}-##g;s#-#_#g;s#v##")"
}

package() {
  cd "${srcdir}/compute-image-packages"

  python2 setup.py install --root="${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Remove scripts in /usr/bin to avoid conflicts with gce-compute-image-packages
  rm -r "${pkgdir}/usr/bin"
}
