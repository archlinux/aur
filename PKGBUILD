# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=git-trim
pkgver=0.4.2
pkgrel=3
pkgdesc='Trims your git remote tracking branches'
arch=('i686' 'x86_64')
url="https://github.com/foriequal0/git-trim"
license=('MIT')
depends=('libgit2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" openssl-version.patch)
sha256sums=('0f728c7f49cc8ffb0c485547a114c94bdebd7eead9466b1b43f486ef583a3d73'
            '626f404a25bd3c3195a526e17af71b30467cbb3852593de657731952f2ce2cb0')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../openssl-version.patch
}

build() {
  cd "$pkgname-$pkgver"
  LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
