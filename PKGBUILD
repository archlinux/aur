# Contributor: Nathan Isom <nathanisom27[at]gmail[dot]com>

pkgname=bevelbar-git
pkgver=25.08.r0.g88cd727
pkgrel=1
pkgdesc='X11 status bar with beveled borders'
arch=('x86_64')
url="https://movq.de/git/bevelbar"
license=('MIT')
depends=('libx11' 'libxft' 'libxrandr')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
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
