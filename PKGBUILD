# Maintainer: Stefan Nyman <stefan.j.nyman@gmail.com>
pkgname=tpfand-git
pkgver=0.93.r0.fa48281
pkgrel=1
pkgdesc="Fan controller daemon for ThinkPads"
arch=(x86_64)
url="https://github.com/StefanNyman/tpfand"
license=('MIT')
groups=()
depends=('glibc')
makedepends=('git') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/StefanNyman/tpfand.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    git fetch && git fetch --tags
    git checkout v0.93
    make
}

check() {
    cd "$srcdir/${pkgname%-git}"
    make -k check
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/usr/" install
}
