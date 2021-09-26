# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=pyhoca-cli
pkgver=0.6.1.2
pkgrel=1
pkgdesc="Command line X2Go client written in Python"
url="http://www.x2go.org/"
arch=('any')
license=('AGPL')
makedepends=('python-setuptools')
depends=('python-x2go' 'python-setproctitle')
source=("http://code.x2go.org/releases/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fef5d3e3b9cefc5ab8bb32b9e3af046ea11cc8b8435d613603a462b3b7675e89')

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
