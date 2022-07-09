# Maintainer: a821
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=json2tsv-git
_pkgname=${pkgname%-git}
pkgver=0.8.r9.ge2eeb26
pkgrel=1
pkgdesc='JSON to TSV converter'
arch=('x86_64')
url='https://codemadness.org/json2tsv.html'
license=('ISC')
depends=('glibc')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
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
  install -Dm755 json2tsv -t "${pkgdir}/usr/bin"
  install -Dm644 json2tsv.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
