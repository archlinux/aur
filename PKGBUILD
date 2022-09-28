# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
pkgname=git-gone
pkgver=0.4.1
pkgrel=1
pkgdesc='Prune stale local Git branches'
arch=('i686' 'x86_64')
url="https://codeberg.org/flausch/git-gone"
license=('Apache')
depends=('git' 'libgit2')
conflicts=('git-gone-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('bdac9578c3ae2e4d175d0440ab393c4f5b41339a127d637567d842afcabff02b6566801699ebf05eca23a0e85af3a6fb58eff505c7b9cd35064808899a47b6e8')

build() {
    cd "$pkgname"

    LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
    install -Dm755 "$srcdir/$pkgname/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname/git-gone.1" "$pkgdir/usr/share/man/man1/git-gone.1"
}
