# Contributor: Nathan Isom <nathanisom27[at]gmail[dot]com>

pkgname=bevelbar-git
pkgver=25.08.r3.gb5c06a9
pkgrel=1
pkgdesc='X11 status bar with beveled borders'
arch=('x86_64')
url="https://movq.de/git/bevelbar"
license=('GPL-3.0-or-later')
depends=('glibc' 'libx11' 'libxft' 'libxrandr' 'sh')
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
    install -Dm644 -t "$pkgdir/usr/share/doc/bevelbar" README CHANGES
}
