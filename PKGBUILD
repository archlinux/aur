# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

# To avoid conflict with uconv from https://www.archlinux.org/packages/core/x86_64/icu/
# uconv will be installed with the name of uconv-c
_pkgname=uconv
__pkgname=${_pkgname}-c
pkgname=${__pkgname}-git

pkgver=0.0.1.r6.g2173c6e
pkgrel=1
pkgdesc='General unit converter for the command line'
arch=('x86_64' 'i686')
url='https://github.com/kevinboone/uconv'
license=('GPL3')
makedepends=('git')
provides=("${__pkgname}")
conflicts=("${__pkgname}")
install='info.install'
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C "${_pkgname}"
}

package() {
  install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
  install -Dm644 "${_pkgname}/man1/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${__pkgname}.1"
  install -Dm644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${__pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
