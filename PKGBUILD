# Maintainer: Zachary M <minein12 at protonmail dot com>

_pkgname='noita_proxy'
pkgname="${_pkgname}-bin"
pkgver=1.6.2
pkgrel=1
pkgdesc='Noita Entangled Worlds mod'
url='https://github.com/IntQuant/noita_entangled_worlds'
_rawurl='https://raw.githubusercontent.com/IntQuant/noita_entangled_worlds'
arch=('x86_64')
license=(
    'MIT'
    'Apache-2.0'
)
depends=(
    'sh'
    'alsa-lib'
    'openssl'
)
provide=(${_pkgname})
conflicts=(${_pkgname})
source=(
    "${url}/releases/download/v${pkgver}/noita-proxy-linux.zip"
    "${_pkgname}.png::${_rawurl}/v${pkgver}/noita-proxy/assets/icon.png"
    "LICENSE-APACHE::${_rawurl}/v${pkgver}/LICENSE-APACHE"
    "LICENSE-MIT::${_rawurl}/v${pkgver}/LICENSE-MIT"
    "noita_proxy.desktop"
)
sha256sums=('2e2498f1e46ab41c277480c48e33bd7ed03aa9955dad9753c1b034e9adc1604d'
            'ecd4f95a07f388e6e393feb79146ce4ae97604646d22e9698253995898a3343c'
            '59899c6091b540582ed617e8eeaac4919dc985ccfc35459ee9752b699be5205b'
            'c97af108287fce52a6e0d1197ad8bc92a9a470b484942c0bbb74469d8475e2d4'
            '512c06c20b86cd51188f883904efc7f48d59b852ee5607a80b11337a92ca1899')
install=${_pkgname}.install

package() {
    install -Dm 644 LICENSE-APACHE \
        -t "$pkgdir/usr/share/licenses/$pkgname"

    install -Dm 644 LICENSE-MIT \
        -t "$pkgdir/usr/share/licenses/$pkgname"

    install -Dm 644 noita_proxy.png \
        -t "$pkgdir/usr/share/icons"

    install -Dm 755 noita_proxy.x86_64 \
        -T "$pkgdir/usr/lib/noita_proxy/noita_proxy"

    install -Dm 644 libsteam_api.so \
        -t "$pkgdir/usr/lib/noita_proxy"

    install -Dm 644 noita_proxy.desktop \
        -t "$pkgdir/usr/share/applications"

    printf '#!/usr/bin/env sh\nexec /usr/lib/noita_proxy/noita_proxy $@' | \
        install -Dm 755 /dev/stdin "$pkgdir/usr/bin/noita_proxy"
}
