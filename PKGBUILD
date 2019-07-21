# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Diogo Leal <estranho@diogoleal.com>
# Contributor: Romain "Artefact2" Dalmaso <artefact2@gmail.com>
# Contributor: Bob Fanger < bfanger(at)gmail >
pkgname=apachetop
pkgver=0.19.7
pkgrel=1
pkgdesc="A curses-based top-like display for Apache information, including requests per second, bytes per second, most popular URLs, etc."
arch=('x86_64')
url="http://github.com/tessus/apachetop"
license=('BSD')
depends=('ncurses')
makedepends=()
source=(https://github.com/tessus/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('7f0ad1cd11cd1f86052bbfd63f27ecb6cb74012a17321354af70abf05998c4eb')

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

