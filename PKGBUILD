# Maintainer: Josh Ellithorpe <quest@mac.com>

_pkgname="kyanos"
pkgname="${_pkgname}-git"
pkgver=1.5.0.r16.g921f701
pkgrel=1
pkgdesc="Visualize the time packets spend in the kernel, watch & analyze in command line."
arch=('i686' 'x86_64')
url="https://kyanos.io/"
depends=('glibc')
makedepends=('go' 'make' 'clang' 'llvm')
license=('Apache')
source=("git+https://github.com/hengyoush/${_pkgname}.git")
sha256sums=('SKIP')
provides=("${_pkgname}")

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  git submodule update --init --recursive
  make build-bpf && make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -vDm755 "${_pkgname}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "README_CN.md" "${pkgdir}/usr/share/doc/${_pkgname}/README_CN.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
