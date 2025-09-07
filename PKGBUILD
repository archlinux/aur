# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=pyhoca-cli
pkgver=0.6.1.3
pkgrel=1
pkgdesc="Command line X2Go client written in Python"
url="http://www.x2go.org/"
arch=('any')
license=('AGPL')
makedepends=('python-setuptools')
depends=('python-x2go' 'python-setproctitle')
source=("http://code.x2go.org/releases/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e51d9a9a30c7b5faf6d6a9c120a2c5f294ea5ba028d536af926fcf1c5c19c9d4')

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
