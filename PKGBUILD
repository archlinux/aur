# Contributor: Nathan Isom <nathanisom27[at]gmail[dot]com>

pkgname=bevelbar-git
pkgver=24.07.r0.gf9d3380
pkgrel=1
pkgdesc='X11 status bar with beveled borders'
arch=('x86_64')
url="https://www.uninformativ.de/git/bevelbar/file/README.html"
license=('MIT')
depends=('libx11' 'libxft' 'libxrandr')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://www.uninformativ.de/git/bevelbar.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make prefix=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
