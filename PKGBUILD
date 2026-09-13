# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=pingo
pkgver=1.29rc3
pkgrel=1
pkgdesc='Lossless and lossy image optimizer for PNG/JPEG/WebP/APNG (uses wine)'
arch=('any')
url='https://css-ig.net/pingo'
license=('LicenseRef-Custom')
depends=(
    'sh'
    'wine')
makedepends=(
    'git')
options=('!debug' '!strip')
source=("pingo-${pkgver}.zip"::'https://css-ig.net/bin/pingo.zip'
        'git+https://github.com/dbermond/shellutils.git'
        'LICENSE')
noextract=("pingo-${pkgver}.zip")
sha256sums=('f166938cb1266d215a83ed7e4550e1edc2063b5e150b3d68712f7d25fa3b5f1c'
            'SKIP'
            '1663e3c3a477660c640a19fb6607b2e4149b52b80b9651ce72a7b153a1fe486c')

_useragent="User-Agent: Mozilla/5.0 (X11; Linux ${CARCH}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.7977.82 Safari/537.36"

DLAGENTS=("https::/usr/bin/curl \
              -gqb '' -LC - --retry 3 --retry-delay 3 \
              -H Upgrade-Insecure-Requests:\ 1 \
              -H ${_useragent// /\\ } \
              -H Referer:\ https://www.css-ig.net/pingo \
              --compressed \
              --output %o \
              %u")

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    bsdtar -xf "pingo-${pkgver}.zip" -C "${pkgname}-${pkgver}"
}

package() {
    install -D -m755 shellutils/image/pingo -t "${pkgdir}/usr/bin"
    install -D -m644 "${pkgname}-${pkgver}/pingo.exe" -t "${pkgdir}/usr/share/${pkgname}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
