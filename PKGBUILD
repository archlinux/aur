# Maintainer: Emmanuel Villavizar Trinidad <evillavizartrinidad@gmail.com>
# Co-Maintainer: Lu Xu <oliver_lew at outlook dot com>

_pkgname=xdg-xmenu
pkgname=xdg-xmenu-git
pkgver=1.0.0.beta.2.r0.g2e2834d
pkgrel=1
pkgdesc="Minimal app menu with xmenu"
url="https://github.com/xlucn/xdg-xmenu"
arch=('x86_64' 'i686')
license=('MIT')
depends=('xmenu' 'libinih')
source=("git+$url#branch=c_version")
install="${pkgname}.install"
sha256sums=("SKIP")
makedepends=('git')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$_pkgname"
    make clean all
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
