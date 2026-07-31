#
# PKGBUILD for ddhx
#
# Maintainer: Uffe Jakobsen: uffe _.at._ uffe _.dot._ org
#

pkgname=ddhx
_pkgname=ddhx
pkgver=0.11.0
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
sha256sums=("3eeb9996840d1124bd5b507da84a189e222589efa2d6636da3fd0d2f80e71db7")

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
