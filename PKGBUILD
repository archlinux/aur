# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=mayhem
pkgname=${_pkgname}-git
pkgver=1.2.3.r0.83d625d
pkgrel=1
pkgdesc="A minimal TUI-based task tracker"
arch=('any')
url="https://github.com/BOTbkcd/${_pkgname}"
license=('MIT')
depends=('sqlite')
makedepends=('git' 'go')
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  go build -o "${srcdir}/${_pkgsrc}/${_pkgname}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
