# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: vscncls <lucaslou4@protonmail.com>

_pkgname='quich'
pkgname="${_pkgname}-git"
pkgver=4.0.0.r3.ged2d2b7
pkgrel=1
pkgdesc='calculator for terminal with numerous features'
arch=('x86_64')
url='https://github.com/Usbac/quich'
license=('MIT')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C "${_pkgname}" LDFLAGS="${LDFLAGS}"
}

package() {
  cd "${_pkgname}"
  install -D -m755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -D -m644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -D -m644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -D -m644 'quich.1' -t "${pkgdir}/usr/share/man/man1"
}
