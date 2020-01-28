# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=neovide
pkgver=0.3.0
pkgrel=1
pkgdesc='No Nonsense Neovim Client in Rust'
arch=('x86_64')
url='https://github.com/Kethku/neovide'
license=('MIT')
depends=('fontconfig' 'freetype2' 'gcc-libs' 'libglvnd' 'glibc')
makedepends=('rust' 'gtk3')
provides=("neovide")
conflicts=("neovide-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('8228691ac9050e83ad83792a5587d63dfe8a0a291f140c14ad39295b7b29be89')

prepare(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/debug = true/opt-level = 3\ndebug = false/' Cargo.toml
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  # install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/neovide/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/neovide" "${pkgdir}/usr/bin/neovide"
}

# vim: ts=2 sw=2 et:
