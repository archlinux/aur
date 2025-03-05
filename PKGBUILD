# Maintainer: samarthj <dev@samarthj.com>
# Packaging binary release from creator's release assests
# Building via python has an issue with cloudflare due to a urllib3 dependency
# https://github.com/mikf/gallery-dl/issues/1117
# This binary release pushes this burden of dependency version resolution to the creator

# shellcheck disable=2034,2148,2154

pkgname=gallery-dl-bin
_pkgname=gallery-dl
pkgver=1.29.0
pkgrel=1
url='https://github.com/mikf/gallery-dl'
pkgdesc='Command-line program to download image-galleries and collections from several image hosting sites (bin)'
arch=('x86_64')
depends=('zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
license=(GPL2)
source=("$_pkgname-$pkgver.bin::${url}/releases/download/v${pkgver}/gallery-dl.bin"
  "$_pkgname-$pkgver.bin.sig::${url}/releases/download/v${pkgver}/gallery-dl.bin.sig")
validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88')
sha512sums=('908dcdc8b32ef0f70bf66bbc0391e1ff2d296c120750941492b3f892aa781a0d1687daead0f622f9a3bb3721a3319cecaf15f7be252820651f9154abea8cb692'
            'SKIP')

package() {
  cd "${srcdir}" || exit
  install -Dm0755 "${_pkgname}-${pkgver}.bin" "${pkgdir}/usr/bin/${_pkgname}"
}
