# Maintainer: deadc0de6 <info@deadc0de.ch>

_pkgname=gocatcli
pkgname="${_pkgname}-git"
pkgver=1.0.3.r0.g90d66f0
pkgrel=1
pkgdesc='The command line catalog tool for your offline data'
arch=('x86_64')
url="https://github.com/deadc0de6/gocatcli"
license=('GPL')
makedepends=('go' 'git')
provides=('gocatcli')
conflicts=('gocatcli')
source=("git+https://github.com/deadc0de6/gocatcli.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "${_pkgname}"
  make build
}

package() {
  install -Dm755 "build/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}