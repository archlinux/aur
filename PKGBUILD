pkgname=pidgin-indicator
pkgver=0.9
pkgrel=1
pkgdesc="Pidgin plugin that adds tray icon using libappindicator"
arch=('i686' 'x86_64')
url="https://github.com/philipl/pidgin-indicator"
license=('GPL')
depends=('libpurple' 'libappindicator-gtk2')
makedepends=('intltool')
install=pidgin-indicator.install
source=(https://github.com/philipl/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('2593b248c7c11adc65936d4709c453b6d3bae9437fd6d1f9e6ee092de55efbee')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"

    ./configure
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"

    sed 's#prefix = /usr/local#prefix = /usr#g' -i Makefile -i po/Makefile -i icons/Makefile -i src/Makefile
    make DESTDIR="${pkgdir}" install
}
