# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=quick-webapps
pkgver=2.0.1
pkgrel=1
pkgdesc="Web App Manager for the COSMIC™ desktop written with love and libcosmic."
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/web-apps"
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'libxkbcommon'
  'openssl'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
conflicts=('cosmic-wam' 'cosmic-webapps')
source=("git+https://github.com/cosmic-utils/web-apps.git#tag=$pkgver")
sha256sums=('14c0faf75c34a077a25e43901022daf6e79396112d7b9ee21c6977a3a0bb5974')

prepare() {
  cd web-apps
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd web-apps
  export RUSTUP_TOOLCHAIN=stable
  just build-release
}

package() {
  cd web-apps
  just rootdir="$pkgdir" prefix='/usr' install
}
