# Maintainer: IroAlexis <iroalexis@outlook.fr>

_pkgname=gogextract
pkgname=${_pkgname}-git
pkgver=r96.e32f22d
pkgrel=1
pkgdesc='Unpack GOG Linux installers'
arch=('any')
url='https://framagit.org/IroAlexis/gogextract'
license=('GPL-3.0-or-later')
depends=('libzip')
makedepends=('git')
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"

    make
}

package() {
  install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README.md"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et: