# Maintainer: Jeremy Herczeg <jeremyherczeg@gmail.com>
pkgname=rusty-autoclicker-git
pkgver=v2.4.0.r0.g3066e11
pkgrel=1
pkgdesc="A pure Rust portable auto clicker built for Linux, macOS & Windows"
arch=('x86_64')
url="https://github.com/MrTanoshii/rusty-autoclicker"
license=('CC0')
depends=()
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('rusty-autoclicker::git+https://github.com/MrTanoshii/rusty-autoclicker.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
  cargo build --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
  install -Dm755 target/release/${pkgname%-git} "$pkgdir/usr/bin/${pkgname%-git}"
}
