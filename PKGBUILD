# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=neovide-git
pkgver=0.4.0.r5.g20a7320
pkgrel=1
pkgdesc='No Nonsense Neovim Client in Rust'
arch=('x86_64')
url='https://github.com/Kethku/neovide'
license=('MIT')
depends=('fontconfig' 'freetype2' 'gcc-libs' 'libglvnd' 'glibc')
makedepends=('git' 'rust' 'gtk3')
provides=("neovide")
conflicts=("neovide")
source=("${pkgname}::git+${url}")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "${srcdir}/${pkgname}"
  sed -i 's/debug = true/opt-level = 3\ndebug = false/' Cargo.toml
}

build() {
  cd "${srcdir}/${pkgname}"
  cargo build --release
}

package() {
  install -Dm644 ${srcdir}/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/neovide/LICENSE
  install -Dm755 ${srcdir}/${pkgname}/target/release/neovide ${pkgdir}/usr/bin/neovide
}

# vim: ts=2 sw=2 et: