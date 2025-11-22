# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=bdfconv-git
pkgver=r3213.924f3a93
pkgrel=1
pkgdesc="BDF font converter tool from u8g2 library"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/olikraus/u8g2"
license=('BSD')
depends=('glibc')
makedepends=('git' 'make' 'gcc')
provides=('bdfconv')
conflicts=('bdfconv')
source=("git+https://github.com/olikraus/u8g2.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/u8g2"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/u8g2/tools/font/bdfconv"
    make
}

package() {
    cd "$srcdir/u8g2/tools/font/bdfconv"

    # Install the binary
    install -Dm755 bdfconv "$pkgdir/usr/bin/bdfconv"

    # Install license from main repo
    install -Dm644 "$srcdir/u8g2/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
