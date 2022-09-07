# Maintainer: Campbell Jones <arch at serebit dot com>

pkgname=budgie-backgrounds-git
pkgver=v0.1.r0.g3cbb7cf
pkgrel=2
pkgdesc="The default background set for the Budgie Desktop - latest git"
url="https://github.com/BuddiesOfBudgie/budgie-backgrounds"
license=("custom:CC0-1.0")
arch=(any)
depends=()
makedepends=(git meson imagemagick jhead)
provides=('budgie-backgrounds')
conflicts=('budgie-backgrounds')
source=("$pkgname"::'git+https://github.com/BuddiesOfBudgie/budgie-backgrounds.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    arch-meson "$pkgname" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm644 "$pkgname"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
