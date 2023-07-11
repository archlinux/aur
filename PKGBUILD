# Maintainer: Thibault Saunier <tsaunier@gnome.org>
# Contributor: Arti Zirk <arti.zirk@gmail.com>

pkgname="dssim-git"
_pkgname="dssim"
pkgrel=1
pkgver=3.2.4.r9.gfb60e92
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
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
