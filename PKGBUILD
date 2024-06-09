# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: neodarz <neodarz@neodarz.net>

_pkgname=terminalimageviewer
pkgname=${_pkgname}-git
_pkgName=TerminalImageViewer
_binname=tiv
pkgver=1.2.1.r49.4d21a05
pkgrel=1
pkgdesc="Small C++ program to display images in a (modern) terminal using RGB ANSI codes and unicode block graphics characters"
arch=('any')
url="https://github.com/stefanhaustein/${_pkgName}"
license=('Apache')
depends=('imagemagick')
makedepends=('git' 'make' 'gcc' 'imagemagick')
provides=("${_binname}=${pkgver%%.r*}")
conflicts=("${_binname}")
_pkgsrc="${_pkgName}"
source=("${_pkgsrc}"::"git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  printf "%s" "$(git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${_pkgsrc}/src"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "src/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_binname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}
