# Maintainer: samarthj <dev@samarthj.com>
# Packaging binary release from creator's release assests
# Building via python has an issue with cloudflare due to a urllib3 dependency
# https://github.com/mikf/gallery-dl/issues/1117
# This binary release pushes this burden of dependency version resolution to the creator

# shellcheck disable=2034,2148,2154

pkgname=gallery-dl-bin
_pkgname=gallery-dl
pkgver=1.18.3
pkgrel=1
url='https://github.com/mikf/gallery-dl'
pkgdesc='Command-line program to download image-galleries and collections from several image hosting sites (bin)'
arch=('x86_64')
depends=('zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
license=(GPL2)
source=("$_pkgname-$pkgver.bin::${url}"/releases/download/v"${pkgver}"/gallery-dl.bin
"$_pkgname-$pkgver.bin.sig::${url}"/releases/download/v"${pkgver}"/gallery-dl.bin.sig)
validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88')
sha512sums=('f6940db72532765f58448808578f26a219be2e9866954956f48e26e51574802fd8674cd5982a4e753107a288c3acff84f15aeec8817389c0c997cca29d73b201'
            'SKIP')

package() {
  cd "${srcdir}" || exit
  install -Dm0755 "${_pkgname}-${pkgver}.bin" "${pkgdir}/usr/bin/${_pkgname}"
}
