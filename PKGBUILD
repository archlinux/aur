# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=neovide-git
pkgver=0.5.0.r46.g2815a28
pkgrel=1
pkgdesc='No Nonsense Neovim Client in Rust'
arch=('x86_64')
url='https://github.com/Kethku/neovide'
license=('MIT')
depends=('fontconfig' 'freetype2' 'libglvnd' 'sndio')
makedepends=('git' 'rust' 'gtk3' 'cmake' 'sdl2')
provides=("neovide")
conflicts=("neovide")
source=("${pkgname}::git+${url}")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  sed -i 's/debug = true/opt-level = 3\ndebug = false/' Cargo.toml
}

build() {
  cd "${srcdir}/${pkgname}"
  export CARGO_HOME="${srcdir}/${pkgname}/CARGO"
  cargo build --release
}

package() {
  install -Dm644 ${srcdir}/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/neovide/LICENSE
  install -Dm755 ${srcdir}/${pkgname}/target/release/neovide ${pkgdir}/usr/bin/neovide
  install -Dm644 ${srcdir}/${pkgname}/assets/neovide.desktop ${pkgdir}/usr/share/applications/neovide.desktop
}

# vim: ts=2 sw=2 et:
