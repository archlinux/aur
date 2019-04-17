# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=pyhoca-cli
pkgver=0.6.0.1
pkgrel=1
pkgdesc="Command line X2Go client written in Python"
url="http://www.x2go.org/"
arch=('any')
license=('AGPL')
makedepends=('python-setuptools')
depends=('python-x2go' 'python-setproctitle')
source=("http://code.x2go.org/releases/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8ad4e711fe4f34f7177e6ea1a54f72b82da11cf729292b3f608e71e56afdd875')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  # Install executable
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "${pkgname}"
  # Install man page
  install -m 755 -d "${pkgdir}/usr/share/man/man1"
  install -m 755 -t "${pkgdir}/usr/share/man/man1" "man/man1/${pkgname}.1"
}
