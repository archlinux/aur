# Maintainer: dreieck

_pkgname="chdk-acid"
pkgname="${_pkgname}-bin"
pkgver=1.16_2007
pkgrel=1
epoch=0
pkgdesc="Tool to identify camera type and firmware version of several Canon compact cameras, and to automatically download the proper CHDK build."
arch=(
  any
)
url="http://www.zenoshrdlu.com/acid/acid.html"
license=(
  'custom: freeware'
)
groups=(
  'chdk'
)
depends=(
  'bash'
  'java-runtime'
)
makedepends=()
checkdepends=()
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "acid_${pkgver}.tar.gz::http://www.zenoshrdlu.com/acid/acid.tar.gz"
  "${_pkgname}_${pkgver}.html::${url}"
  "acid.sh"
  "LICENCE_${pkgver}.txt::https://github.com/Brainpowered/ACID/raw/master/LICENCE.txt"
)
noextract=()
sha256sums=(
  'a370f40471d9c92b4c06d50555099e10c9566ce6250f98bbad6c6c08de31d987'
  'ca9dc069e808add5abda05e30409967e081a6632ed3a53b2edbfc66210762d41'
  'd085fabf9a971e57251b852b3d26f00d196be29474993e09616800a672dec68e'
  'e7468438ac7a9fa27d398d3180bc4ce9b035178b776be8136aea5bfbfa4de62b'
)
validpgpkeys=()


prepare() {
  printf '%s\n' "${url}" > "${srcdir}/website.url"
}

package() {
  install -v -m644 -D "${srcdir}/acidu/acid.jar"     "${pkgdir}/usr/lib/acid/acid.jar"
  install -v -m755 -D "${srcdir}/acid.sh"                  "${pkgdir}/usr/bin/acid"

  install -v -m644 -D "${srcdir}/${_pkgname}_${pkgver}.html"         "${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}.html"
  install -v -m644 -D "${srcdir}/website.url"              "${pkgdir}/usr/share/doc/${_pkgname}/website.url"
  install -v -m644 -D "${srcdir}/LICENCE_${pkgver}.txt"  "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt"
  cd "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -sfv "/usr/share/licenses/${pkgname}/COPYING.txt"     'COPYING.txt'
}
