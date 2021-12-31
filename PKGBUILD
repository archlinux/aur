# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
pkgname=stow-cm
pkgver=nightly
pkgrel=1
pkgdesc="config manager (simple impl of gun-stow)"
arch=('x86_64')
url="https://github.com/someoneonsmile/stow"
license=('GPL2')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('stow')
source=("${pkgname}::git+https://github.com/someoneonsmile/stow.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    printf "nightly-%s.%s" "$(git rev-list --count nightly)" "$(git rev-parse --short nightly)"
}

build() {
  cd "stow-$pkgver"
  cargo build --release
}

package() {
  cd "stow-$pkgver"
  install -Dm755 "target/release/stow" "$pkgdir/usr/bin/stow"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
