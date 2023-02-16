# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Diogo Leal <estranho@diogoleal.com>
# Contributor: Romain "Artefact2" Dalmaso <artefact2@gmail.com>
# Contributor: Bob Fanger < bfanger(at)gmail >
pkgname=apachetop
pkgver=0.23.2
pkgrel=1
pkgdesc="A curses-based top-like display for Apache information, including requests per second, bytes per second, most popular URLs, etc."
arch=('x86_64')
url="http://github.com/tessus/apachetop"
license=('BSD')
depends=('ncurses')
makedepends=()
source=(https://github.com/tessus/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('f94a34180808c3edb24c1779f72363246dd4143a89f579ef2ac168a45b04443f')

build() {
        cd "${pkgname}-${pkgver}"
        ./configure --prefix=/usr --with-logfile=/var/log/httpd/access_log  || return 1

}
package(){
        cd "${pkgname}-${pkgver}"
        make || return 1
        make DESTDIR=$pkgdir install || return 1
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

