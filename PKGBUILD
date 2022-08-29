# Maintainer: samarthj <dev@samarthj.com>
# Packaging binary release from creator's release assests
# Building via python has an issue with cloudflare due to a urllib3 dependency
# https://github.com/mikf/gallery-dl/issues/1117
# This binary release pushes this burden of dependency version resolution to the creator

# shellcheck disable=2034,2148,2154

pkgname=gallery-dl-bin
_pkgname=gallery-dl
pkgver=1.23.0
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
sha512sums=('9f1e7b8ca2a4b0caef3ac71e91e3e7ac51a68b74b7d4ed9f2572188a0a28f95997e68bca8f5f034ea91837976eba7b9d76b6626b0fe669196e56e974c56217e5'
            'SKIP')

package() {
  cd "${srcdir}" || exit
  install -Dm0755 "${_pkgname}-${pkgver}.bin" "${pkgdir}/usr/bin/${_pkgname}"
}
