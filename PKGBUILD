# Maintainer: a821
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=json2tsv-git
_pkgname=${pkgname%-git}
pkgver=1.2.r0.g66e7e40
pkgrel=1
pkgdesc='JSON to TSV converter'
arch=('x86_64')
url='https://codemadness.org/json2tsv.html'
license=('ISC')
depends=('awk' 'glibc' 'sh')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "jaq")
source=("git://git.codemadness.org/json2tsv")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C "${_pkgname}"
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX=/usr MANPREFIX=/usr/share/man install
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
