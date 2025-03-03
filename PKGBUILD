# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rustywind
pkgver=0.24.0
pkgrel=1
pkgdesc='CLI for organizing Tailwind CSS classes'
arch=('any')
url=https://github.com/avencera/rustywind
OPTIONS=(!lto)
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('349ff0fefc90d41c2852ff11df54486529050f96ad4c014384cd4a9b25bc507bfa38ebc39c89f230770a9a0391fa73b47a928493c91e28b93cfbe59bcf703a76')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked --offline
}

check() {
  cd $pkgname-$pkgver
  cargo test --locked --offline
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
}
