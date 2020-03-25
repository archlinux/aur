# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=pingo-bin
pkgver=0.99.rc2.14
pkgrel=1
pkgdesc='An experimental, fast Web PNG/JPG optimizer with visually lossless or lossy compression (unix binary)'
arch=('x86_64')
url='https://css-ig.net/pingo'
license=('unknown')
provides=('pingo')
conflicts=('pingo')
options=('!strip')
source=("pingo-nix64-${pkgver}.zip"::'https://css-ig.net/bin/pingo-nix64.zip')
noextract=("pingo-nix64-${pkgver}.zip")
sha256sums=('683a1fa483152e0e5f93f62c3e595b30ad2455ca3f437912481989e627283aba')

_useragent="User-Agent: Mozilla/5.0 (X11; Linux ${CARCH}) \
                        AppleWebKit/537.36 (KHTML, like Gecko) \
                        Chrome/80.0.3987.149 \
                        Safari/537.36"

_useragent="$(printf '%s' "$_useragent" | sed 's/[[:space:]]\+/\\ /g')"

DLAGENTS=("https::/usr/bin/curl \
              -gqb '' -LC - --retry 3 --retry-delay 3 \
              -H authority:\ css-ig.net \
              -H upgrade-insecure-requests:\ 1 \
              -H ${_useragent} \
              -H accept:\ text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3 \
              -H referer:\ https://css-ig.net/pingo \
              -H accept-encoding:\ gzip,\ deflate,\ br \
              -H accept-language:\ en-US,en;q=0.9,pt;q=0.8 \
              -H cookie:\ HttpOnly;\ SERVERID105614=1420122|XSyhV|XSyhV \
              --compressed \
              --output %o \
              %u")

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    bsdtar -xf "pingo-nix64-${pkgver}.zip" -C "${pkgname}-${pkgver}"
}

package() {
    install -D -m755 "${pkgname}-${pkgver}/pingo" -t "${pkgdir}/usr/bin"
}
