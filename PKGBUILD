# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

# To avoid conflict with uconv from https://www.archlinux.org/packages/core/x86_64/icu/
# uconv will be installed with the name of uconv-c
_pkgname=uconv
pkgname=${_pkgname}-c-git

pkgver=0.0.1.r6.g2173c6e
pkgrel=1
pkgdesc='General unit converter for the command line'
arch=('x86_64')
url='https://github.com/kevinboone/uconv'
license=('GPL3')
makedepends=('git')
provides=("${_pkgname}-c")
install='readme.install'
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C "${_pkgname}"
}

package() {
  install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}-c"
  install -Dm644 "${_pkgname}/man1/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}-c.1"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}-c" "${_pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
