# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='webdump'
pkgname="${_pkgname}-git"
pkgver=r101.254e833
pkgrel=2
pkgdesc='Render HTML to stdout'
arch=('any')
url='https://www.codemadness.org/git/webdump/file/README.html'
license=('ISC')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://git.codemadness.org/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make WEBDUMP_CPPFLAGS="-D_DEFAULT_SOURCE" -C "${_pkgname}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" -C "${_pkgname}" install
  install -Dvm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
