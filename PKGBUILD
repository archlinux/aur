# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.15.1
pkgrel=1
pkgdesc='Show CommonMark (a standardized Markdown dialect) documents on text terminals.'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('Apache')
depends=('oniguruma' 'openssl')
conflicts=('mdcat-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('564d1b4afd44ed2e4d8095f95f5a49c08c321cd4074417b500076c966248aeea')

build() {
  cd "$pkgname-$pkgname-$pkgver"

  # We dynamically link against the system libonig so that, that dependency is
  # shared with, and kept up to date with the rest of the system. It means
  # this package will need to have the pkgrel bumped if there is a breaking
  # release to libonig though.
  RUSTONIG_DYNAMIC_LIBONIG=1 RUSTONIG_SYSTEM_LIBONIG=1 cargo build \
    --release --locked
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
