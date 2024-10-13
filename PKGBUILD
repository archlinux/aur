# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="itex2mml"
pkgname="${_pkgname}-bin"
pkgver=1.6.1
pkgrel=1
pkgdesc="iTeX to MathML converter"
arch=('x86_64')
url="https://golem.ph.utexas.edu/~distler/blog/itex2MML.html"
license=('GPL-2.0-or-later OR LGPL-2.0-or-later OR MPL-1.1')
depends=('gcc-libs' 'glibc')
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}.tar.gz")
source=("${_pkgsrc}.tar.gz::https://golem.ph.utexas.edu/~distler/blog/files/itexToMML-${pkgver}.tar.gz")
sha256sums=('3ef2572aa3421cf4d12321905c9c3f6b68911c3c9283483b7a554007010be55f')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}"
  bsdtar -xzf "${_pkgsrc}.tar.gz" --strip-components=3 -C "${srcdir}/${_pkgsrc}" "itexToMML/itex-binaries/Linux"
  bsdtar -xzf "${_pkgsrc}.tar.gz" --strip-components=1 -C "${srcdir}/${_pkgsrc}" "itexToMML/README"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "itex2MML" "${pkgdir}/usr/bin/itex2MML"
  install -Dm644 "README"   "${pkgdir}/usr/share/doc/${_pkgname}/README"
}
