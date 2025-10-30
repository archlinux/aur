# Maintainer: Penguin <penguin@dawn.org.in>

pkgname=scrollmpris-git
pkgver=1.0.0_r24.3e79f70
pkgrel=1
pkgdesc="Scrolling MPRIS module for waybar"
arch=('x86_64')
url="https://github.com/BEST8OY/ScrollMPRIS"
license=('Unlicense')
depends=(
  'dbus'
  'glibc'
  'gcc-libs'
)
makedepends=(
	'rust'
	'git'
)
optdepends=('waybar: for integration with Waybar')
conflicts=("${pkgname}")
provides=("${pkgname}")
source=("${pkgname}::git+https://github.com/BEST8OY/ScrollMPRIS")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  cargo_version=$(grep '^version' Cargo.toml | head -n1 | cut -d'"' -f2)
  printf "${cargo_version}_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  cargo fetch
  cargo build --frozen --release
}

package() {
  cd ${pkgname}
  install -Dt "$pkgdir"/usr/bin ${CARGO_TARGET_DIR:-target}/release/ScrollMPRIS
}
