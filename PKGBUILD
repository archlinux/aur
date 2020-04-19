pkgname=swaywsr-git
pkgver=1.0.0.r7.g7f022ce
pkgrel=1
pkgdesc='sway workspace renamer'
arch=('x86_64')
url='https://github.com/pedroscaff/swaywsr'
license=('MIT')
makedepends=('git' 'rust')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
  cd "${pkgname%-*}"
  cargo build --release
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 "target/release/${pkgname%-*}" "$pkgdir/usr/bin/${pkgname%-*}"
  install -Dm644 assets/example_config.toml -t "$pkgdir/usr/share/doc/${pkgname%-*}/examples/example_config.toml"
}
