# Maintainer: Alastair Hughes <hobbitalastair@gmail.com>
#
# Based on dmenu-wayland-git PKGBUILD.

_pkgname=mew
pkgname=$_pkgname-git
pkgver=0.0.r24.e96bf18
pkgrel=2
pkgdesc="Wayland port of dmenu"
url="https://codeberg.org/sewn/mew"
arch=('i686' 'x86_64')
license=('MIT')
depends=('wayland' 'libxkbcommon' 'fcft')
makedepends=('git' 'pkg-config' 'wayland-protocols' 'tllist')
source=(git+https://codeberg.org/sewn/mew.git)
sha256sums=(SKIP)

pkgver() {
    cd $srcdir/$_pkgname
    git_ver=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
    echo "0.0.$git_ver"
}

prepare() {
    cd "$srcdir/$_pkgname"
    sed -i Makefile -e 's:/usr/local:/usr:g'
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"

    PREFIX="/usr" DESTDIR="$pkgdir" make install
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
