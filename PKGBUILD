# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
pkgname=git-gone
pkgver=0.4.0
pkgrel=1
pkgdesc='Prune stale local Git branches'
arch=('i686' 'x86_64')
url="https://codeberg.org/flausch/git-gone"
license=('Apache')
depends=('git' 'libgit2')
conflicts=('git-gone-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2921a15a90e28967cc5aaec99a44f7be2151fb25f54f9a3e887c6c657c31314a351e2a0af1786b453d29257c1ba516e3e852ad63bebee394f4b74bbceb90802a')

build() {
    cd "$pkgname"

    LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
    install -Dm755 "$srcdir/$pkgname/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname/git-gone.1" "$pkgdir/usr/share/man/man1/git-gone.1"
}
