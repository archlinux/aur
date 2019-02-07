# Maintainer: Sebastian Koller <seb.koller@gmail.com>
pkgname=moneyguru
pkgver=2.13.1
pkgrel=1
pkgdesc="Personal finance management application"
arch=('x86_64')
url="http://www.hardcoded.net/${pkgname}/"
license=('GPL3')
depends=('python' 'python-pyqt5')
makedepends=()
options=(!buildflags)
source=(https://download.hardcoded.net/${pkgname}-${pkgver}.tar.gz)
sha1sums=('1107d08cba2c07c2bbd864387fd0bf3664373081')

build() {
  make -C ${srcdir}/${pkgname}-${pkgver} PREFIX="/usr" DESTDIR="$pkgdir"
}

package() {
  # Fix application icon by fixing single quotation mark in sed command
  sed -i -e '/ICON/s/'"'"'/"/g' ${srcdir}/${pkgname}-${pkgver}/support/install.sh
  make -C ${srcdir}/${pkgname}-${pkgver} PREFIX="/usr" DESTDIR="$pkgdir" install
}
