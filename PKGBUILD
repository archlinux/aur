# Maintainer: cursed <paradoxtools@proton.me>

pkgname=rain-ascii-git
pkgver=0.1.0.r0.g25c672a
pkgrel=1
pkgdesc="Comfy ASCII rain for your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/cursssed/rain"
license=('MIT')
depends=('ncurses')
makedepends=('git' 'make' 'gcc')
provides=('rain-ascii')
conflicts=('rain-ascii' 'rain')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "rain"

    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "rain"
    make
}

check() {
    cd "rain"
    make test
}

package() {
    cd "rain"

    install -Dm755 rain "$pkgdir/usr/bin/rain"
    install -Dm644 rain.conf.example "$pkgdir/usr/share/doc/$pkgname/rain.conf.example"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
