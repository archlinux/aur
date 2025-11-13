#
# PKGBUILD for ddhx-git
#
# Maintainer: Uffe Jakobsen: uffe _.at._ uffe _.dot._ org
# Contributer: dax <dev@dax.moe>
#

pkgname=ddhx-git
_pkgname=ddhx
pkgver=v0.7.2.r4.g7e60ce5
pkgrel=1
pkgdesc="Console hexadecimal file viewer"
arch=('x86_64')
url="https://github.com/dd86k/ddhx"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'dub' 'dmd')
provides=("ddhx")
conflicts=("ddhx")
source=('git+https://github.com/dd86k/ddhx')
sha256sums=('SKIP')

pkgver() {
  #cd "${srcdir}/${_pkgname}-${_pkgver}"
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	dub build -b release-nobounds
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -D ddhx "${pkgdir}/usr/bin/ddhx"
	install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m 0644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
	#install -D -m 0644 docs/ddhx.1 "${pkgdir}/usr/share/man/man1/ddhx.1"
	#install -D -m 0644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

#
# EOF
#
