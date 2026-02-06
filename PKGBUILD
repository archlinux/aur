# If you have a problem/question or want to improve this PKGBUILD,
# you can create an issue/pull request on this Github repository:
#
# https://github.com/siaeyy/PKGBUILDs
#
# You can still use the Arch website as well.
#

_pkgname=pixi
pkgname="$_pkgname"-git
pkgver=0.1.0.r796.g4e0a8736
pkgrel=1
pkgdesc="Pixel art editor made with Zig."
arch=('any')
url="https://github.com/foxnne/pixi.git"
license=('MIT')
depends=()
makedepends=('git' 'zig>=0.15.1', 'gtk3')
source=(git+"$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --tags --long | \
        sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "$srcdir/$_pkgname"

    zig build
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm644 readme.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    cd zig-out/bin

    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/lib/assets"

    cp -r assets "$pkgdir/usr/lib/"

    install -Dm755 Pixi "$pkgdir/usr/lib/$_pkgname"
    
    ln -s "/usr/lib/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
