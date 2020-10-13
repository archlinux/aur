# Maintainer: r4v3n6101 <raven6107@gmail.com>

pkgname=hlbsp-git
_pkgbase=hlbsp
pkgver=0.4.6
pkgrel=1
pkgdesc="Half-Life's .BSP maps viewer."
arch=('any')
url="https://github.com/r4v3n6101/hlbsp"
license=('GPL')
makedepends=('rust' 'cargo' 'git')
source=("${pkgname}::git+https://github.com/r4v3n6101/hlbsp")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
