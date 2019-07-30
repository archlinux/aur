# Maintainer: Andrea Pascal <andrea@anodium.net>

pkgname=wla-dx-git
pkgver=9.8.r640.6fd0465
pkgrel=1
pkgdesc="Yet Another GB-Z80/Z80/6502/65C02/6510/65816/6800/HUC6280/SPC-700 Multi Platform Cross Assembler Package"
arch=('any')
url="https://github.com/vhelin/wla-dx"
license=('GPL2')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/vhelin/wla-dx.git')
sha384sums=('SKIP')

pkgver() {
    cd "$srcdir/wla-dx"
    printf "%s.r%s.%s" "$(git describe --long --tags | sed -r 's/^v//;s/-([0-9,a-g,A-G].*)//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/wla-dx"
    cmake -G "Unix Makefiles" .
    make
}

package() {
    cd "$srcdir/wla-dx"
    make DESTDIR="$pkgdir/" install
}
