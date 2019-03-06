# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=pingo-bin
pkgver=0.99.beta18
pkgrel=1
pkgdesc='An experimental, fast Web PNG/JPG optimizer with visually lossless or lossy compression (unix binary)'
arch=('x86_64')
url='https://css-ig.net/pingo'
license=('unknown')
provides=('pingo')
conflicts=('pingo')
options=('!strip')
source=("pingo-nix-${pkgver}.zip"::'https://css-ig.net/downloads/zip/pingo-nix.zip')
noextract=("pingo-nix-${pkgver}.zip")
sha256sums=('14f84c8f7c7a112b8b55b7d37f9da6f52b4f8c78b6aaa2378b120b61605966b4')

_useragent="User-Agent: Mozilla/5.0 (X11; Linux ${CARCH}) \
                        AppleWebKit/537.36 (KHTML, like Gecko) \
                        Chrome/72.0.3626.121 \
                        Safari/537.36"

_useragent="$(printf '%s' "$_useragent" | sed 's/[[:space:]]\+/\\ /g')"

DLAGENTS=("https::/usr/bin/curl \
              -gqb '' -LC - --retry 3 --retry-delay 3 \
              -H Accept-Encoding:\ gzip,\ deflate,\ br \
              -H Accept-Language:\ en-US,en;q=0.9 \
              -H Upgrade-Insecure-Requests:\ 1 \
              -H ${_useragent} \
              -H Accept:\ text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8 \
              -H Referer:\ https://css-ig.net/pingo.php \
              -H Cookie:\ HttpOnly;\ HttpOnly;\ HttpOnly;\ startBAK=R3415750288;\ start=R3918464565 \
              -H Connection:\ keep-alive \
              -o %o \
              --compressed \
              %u")

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    cd "${pkgname}-${pkgver}"
    bsdtar -xf "../pingo-nix-${pkgver}.zip"
}

package() {
    install -D -m755 "${pkgname}-${pkgver}/pingo" -t "${pkgdir}/usr/bin"
}
