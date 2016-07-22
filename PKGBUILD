# Maintainer: Manuel Mendez <mmendez534@gmail.com>
# github.com/mmlb/pangoterm-bzr

pkgname=pangoterm-bzr
pkgver=r594
pkgrel=1
pkgdesc='A GTK/Pango-based terminal that uses libvterm to provide terminal emulation.'
arch=('i686' 'x86_64')
url='http://www.leonerd.org.uk/code/pangoterm'
license=('MIT')
depends=('libvterm-bzr')
makedepends=('bzr' 'libvterm-bzr')
provides=("${pkgname%-bzr}")
conflicts=("${pkgname%-bzr}")
install=pangoterm.install
source=('bzr+http://bazaar.leonerd.org.uk/code/pangoterm/'
    'pangoterm.install')
sha256sums=('SKIP'
    'd51e7b8fbf5ecd9766bb4ea997971be240342bd1eb50fa1505da2ffdeedd6645')

pkgver() {
    cd "$srcdir/${pkgname%-bzr}"
    printf "r%s" "$(bzr revno)"
}

build() {
    cd "$srcdir/${pkgname%-bzr}"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/${pkgname%-bzr}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bzr}/LICENSE"
    install -Dm644 pangoterm.cfg "${pkgdir}/usr/share/${pkgname%-bzr}/pangoterm.cfg"
}

# vim:set sw=4 sts=4 et:
