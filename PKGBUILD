# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=archy-dwm
pkgver=1.0.0
pkgrel=3
pkgdesc='Dynamic window manager for X with some patches applied'
url="https://github.com/archy-linux/$pkgname"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11' 'libxinerama' 'libxft' 'freetype2')
makedepends=('make' 'gzip')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('859018ae182326048e99e4ba500b9fae199e3e76359af17a9c98f735f118505e')

build() {
    cd "$pkgname-$pkgver"
    make -j
    gzip -9 archy-dwm.1
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t ${pkgdir}/usr/bin 'build/archy-dwm'
    install -Dm644 -t ${pkgdir}/usr/share/man/man1 archy-dwm.1.gz
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=4 sw=4 et:
