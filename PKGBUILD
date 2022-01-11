# Maintainer: r4v3n6101 <raven6107@gmail.com>

_pkgbase=hlbsp
pkgname=${_pkgbase}-git
pkgver=r150.a5e59d9
pkgrel=1
pkgdesc="Half-Life's .BSP maps viewer."
arch=('any')
url="https://github.com/r4v3n6101/hlbsp-viewer"
license=('GPL')
makedepends=('rust' 'cargo' 'git')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=("${pkgname}::git+https://github.com/r4v3n6101/hlbsp-viewer")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  cargo fetch
}

build() {
  cd "${srcdir}/${pkgname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 755 "target/release/${_pkgbase}" "${pkgdir}/usr/bin/${_pkgbase}"
}
