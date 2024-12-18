# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="ccase"
pkgname="${_pkgname}-bin"
pkgver=0.4.1
pkgrel=1
pkgdesc="A command line utility for converting between string cases"
arch=('x86_64')
url="https://github.com/rutrum/${_pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("LICENSE-${pkgver}.md::${url}/raw/v${pkgver}/LICENSE.md")
source_x86_64=("${_pkgsrc}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_amd64.deb")
sha256sums=('507433b065f4daa9d69b7d1b8be1c23acde51b99fd0946fe658e1866493c5b94')
sha256sums_x86_64=('a5386d8907163671f318ea8f73574e3df3d8d8b99b4d757b20150cc6d2b23c57')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}/usr"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}/usr"
  rm -f data.tar.*
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/doc/${_pkgname}"
  rm -f copyright*
}

package() {
  cd "${srcdir}"
  install -vDm644 "LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgsrc}-${CARCH}"
  cp -vr --no-preserve=ownership * "${pkgdir}"
}
