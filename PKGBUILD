# Maintainer: Douglas Christman <DouglasChristman [at] gmail [dot] com>

pkgname=termboy
_pkgname=termboy-go
pkgver=0.1.1
pkgrel=1
pkgdesc='A Nintendo GameBoy emulator for the Linux console'
arch=(i686 x86_64)
url="https://github.com/dobyrch/${_pkgname}"
license=(MIT)
makedepends=(go)
source=("https://github.com/dobyrch/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a74b7c616fc895846259bd19ef6805f2ac1542b0c3a0cbaa457deb4a982b9588')

prepare() {
  # `go build` expects the source code to exist in
  # "$GOPATH/src/github.com/dobyrch/". Use $srcdir as $GOPATH.
  cd "${srcdir}"
  mkdir -p src/github.com/dobyrch
  mv "${_pkgname}-${pkgver}" "src/github.com/dobyrch/${_pkgname}"
}

build() {
  cd "${srcdir}/src/github.com/dobyrch/${_pkgname}"
  GOPATH="${srcdir}" go build
}

package() {
  cd "${srcdir}/src/github.com/dobyrch/${_pkgname}"
  install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
