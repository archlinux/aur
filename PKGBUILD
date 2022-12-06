# Maintainer: samarthj <dev@samarthj.com>
# Packaging binary release from creator's release assests
# Building via python has an issue with cloudflare due to a urllib3 dependency
# https://github.com/mikf/gallery-dl/issues/1117
# This binary release pushes this burden of dependency version resolution to the creator

# shellcheck disable=2034,2148,2154

pkgname=gallery-dl-bin
_pkgname=gallery-dl
pkgver=1.24.1
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
sha512sums=('3300108b2abe1727f893f1e7dd83f6ffd5076ebabff3a607227e29592d1cc989b966131f770542f157296dbe0b1f8905b5e3d72947cf9b160f910888d89d6180'
            'SKIP')

package() {
  cd "${srcdir}" || exit
  install -Dm0755 "${_pkgname}-${pkgver}.bin" "${pkgdir}/usr/bin/${_pkgname}"
}
