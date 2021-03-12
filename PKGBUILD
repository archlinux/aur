# Maintainer: Marti Raudsepp <marti@juffo.org>
pkgname=ego
pkgver=1.1.0
pkgrel=1
pkgdesc="Alter Ego: run Linux desktop applications under a different local user"
arch=('x86_64')
url="https://github.com/intgr/ego"
license=('MIT')
depends=('acl')
makedepends=('cargo')
optdepends=('xdg-desktop-portal-gtk: improved desktop integration')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/intgr/$pkgname/archive/$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('19fcec3766382a62b35d07590da513955dbbb85678b56d85e932addd47f9ae433054bd61f77f594cfbcf5d541b51c50e6becdda6088f5ecd6c68d6fe9d8eac28')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  cargo install --no-track --locked --root "$pkgdir/usr/" --path .
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/doc/${pkgname}/LICENSE"

  install -Dm644 "varia/ego-completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_ego"
  install -Dm644 "varia/ego-completion.bash"  "$pkgdir/usr/share/bash-completion/completions/ego"
  install -Dm644 "varia/ego-completion.fish" "$pkgdir/usr/share/fish/vendor_completions.d/ego.fish"
}
