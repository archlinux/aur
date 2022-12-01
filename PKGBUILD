# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
pkgname=git-gone
pkgver=0.4.3
pkgrel=1
pkgdesc='Prune stale local Git branches'
arch=('i686' 'x86_64')
url="https://github.com/swsnr/git-gone"
license=('Apache')
depends=('git' 'libgit2')
conflicts=('git-gone-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('47eb0080a22a29ab12783b0cc1f4b7b6f5cee19646ea64d0785172ee9fccf416609422e87736fd6857bbf5572f125c019bf8226d696ad2fefd78dcf638622772')

build() {
    cd "$pkgname-$pkgver"

    LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname-$pkgver/git-gone.1" "$pkgdir/usr/share/man/man1/git-gone.1"
}
