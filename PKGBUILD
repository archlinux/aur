# Maintainer: Thibault Saunier <tsaunier@gnome.org>

pkgname="dssim-git"
_pkgname="dssim"
pkgrel=1
pkgver=r133.cdb66dbc7943
pkgdesc="Image similarity comparison simulating human perception (multiscale SSIM in Rust)"
arch=('x86_64')
url="https://github.com/pornel/dssim/"
license=(AGPL)
depends=()
makedepends=('git' 'rust')
source=("git+https://github.com/pornel/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 target/release/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
