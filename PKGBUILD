# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
pkgname=git-gone
pkgver=0.4.2
pkgrel=1
pkgdesc='Prune stale local Git branches'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/git-gone"
license=('Apache')
depends=('git' 'libgit2')
conflicts=('git-gone-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fd7f5a594774325dcaa30dfe46e78184dd60378a939643f28b8b1e90b46d078d86e302a7a605e6de8607cb531629fbaaa431eefc9ce87a441f3b0ab58551095f')

build() {
    cd "$pkgname-$pkgver"

    LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname-$pkgver/git-gone.1" "$pkgdir/usr/share/man/man1/git-gone.1"
}
