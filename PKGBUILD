# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=txt2epub
pkgname=${_pkgname}-git
pkgver=0.0.1.r0.g73b0c60
pkgrel=3
pkgdesc='Convert one or more plain text files into an EPUB document'
arch=('x86_64')
url='https://github.com/kevinboone/txt2epub'
license=('GPL3')
makedepends=('git' 'pcre')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C "${_pkgname}"
}

package() {
  cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "man1/${_pkgname}.1"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
}

# vim: ts=2 sw=2 et:
