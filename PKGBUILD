#
# PKGBUILD for ddhx
#
# Maintainer: Uffe Jakobsen: uffe _.at._ uffe _.dot._ org
#

pkgname=ddhx
_pkgname=ddhx
pkgver=0.9.3
pkg_name_ver="${_pkgname}-${pkgver}"
pkgrel=1
pkgdesc="Console hexadecimal file viewer"
arch=('x86_64')
url="https://github.com/dd86k/ddhx"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('git' 'dub' 'dmd')
provides=("ddhx")
conflicts=("ddhx")
source=("https://github.com/dd86k/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("a8c80ec4feecac25f9b43f04473207bd8d9caea2adf97a80769571248dd62a42")

#pkgver() {
#  cd "${srcdir}/${pkg_name_ver}"
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

prepare()
{
  cd "${srcdir}/${pkg_name_ver}"
}

build() {
  cd "${srcdir}/${pkg_name_ver}"
  #dub build -b release-nobounds
  make all
}

package() {
  cd "${srcdir}/${pkg_name_ver}"
  #install -D ddhx "${pkgdir}/usr/bin/ddhx"
  make install DESTDIR="${pkgdir}" PREFIX="/usr"
  install -D -m 0644 ddhx.1 "${pkgdir}/usr/share/man/man1/ddhx.1"
  install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 0644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
}

#
# EOF
#
