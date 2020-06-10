# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=gluon-repl
_pkgname=gluon
pkgver=0.15.0
pkgrel=1
pkgdesc='REPL for gluon. A static, type inferred programming language for application embedding'
arch=('i686' 'x86_64')
url="https://github.com/gluon-lang/gluon"
license=('MIT')
conflicts=('gluon-repl-git')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('39d3615cb3109c1d6745199c078a8db17f9dcbe370297d6bb8fe71b6c65d80ee')

build() {
  cd "$_pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable LIBGIT2_SYS_USE_PKG_CONFIG=1 \
    cargo build --release --locked -p gluon_repl
}

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
