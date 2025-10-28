# Maintainer: Jonathan Capps <cappsy at gmail dot com>
pkgname=cosmic-ext-applet-logomenu-git
pkgver="0.6.7"
pkgrel=3
pkgdesc="Logo Menu applet for the COSMIC™ desktop"
arch=('x86_64')
url="https://github.com/cappsyco/cosmic-ext-applet-logomenu-git"
license=('GPL-3.0-or-later')
depends=('cosmic-applets')
makedepends=(
  'cargo'
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/cappsyco/cosmic-ext-applet-logomenu-git.git')
sha256sums=('SKIP')

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
