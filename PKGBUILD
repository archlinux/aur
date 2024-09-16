# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: neodarz <neodarz@neodarz.net>

_binname="tiv"
_pkgname="terminalimageviewer"
pkgname="${_pkgname}-git"
pkgver=1.2.1.r50.g3770786
pkgrel=2
pkgdesc="Display images in a (modern) terminal using RGB ANSI codes and unicode graphic blocks"
arch=('x86_64')
url="https://github.com/stefanhaustein/TerminalImageViewer"
license=('Apache-2.0' 'GPL-3.0-or-later')
makedepends=('git')
depends=('gcc-libs' 'glibc' 'imagemagick')
provides=("${_pkgname}=${pkgver%%.r*}" "${_binname}=${pkgver%%.r*}")
conflicts=("${_pkgname}" "${_binname}")
_pkgsrc="TerminalImageViewer"
source=("${_pkgsrc}"::"git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgsrc}/src"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "src"
  make install DESTDIR="${pkgdir}" prefix='/usr'
}
