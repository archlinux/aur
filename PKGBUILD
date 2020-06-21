# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: vscncls <lucaslou4@protonmail.com>

_pkgname=quich
pkgname=${_pkgname}-git
pkgver=2.4.r7.gbac0edd
pkgrel=1
pkgdesc='Small, easy to use, fast and useful calculator for your terminal with numerous features'
arch=('x86_64' 'i686')
url='https://github.com/Usbac/quich'
license=('MIT')
makedepends=('git')
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
  make DESTDIR="${pkgdir}" PREFIX="/usr" -C "${_pkgname}" install
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
