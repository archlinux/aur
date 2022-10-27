# Maintainer: Emmanuel Villavizar Trinidad <evillavizartrinidad@gmail.com>
# Co-Maintainer: Lu Xu <oliver_lew at outlook dot com>

_pkgname=xdg-xmenu
pkgname=xdg-xmenu-git
pkgver=r113.82629b1_c_version
pkgrel=1
pkgdesc="Show apps menu with xmenu"
url="https://github.com/OliverLew/xdg-xmenu"
arch=('x86_64')
license=('MIT')
depends=('xmenu' 'libinih')
source=("git+$url")
install="${pkgname}.install"
sha256sums=("SKIP")
makedepends=('git')

pkgver() {
    cd "$srcdir/$_pkgname"
    git checkout -q c_version
    printf "r%s.%s_c_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    git checkout -q c_version
    make clean all
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

