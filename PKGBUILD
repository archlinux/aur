pkgname=swaywsr-git
pkgver=1.4.0.r42.g193c4cb
pkgrel=2
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
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}"
  cargo build --release
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 "target/release/${pkgname%-*}" "$pkgdir/usr/bin/${pkgname%-*}"
  install -Dm644 assets/example_config.toml "$pkgdir/usr/share/doc/${pkgname%-*}/examples/example_config.toml"
}
