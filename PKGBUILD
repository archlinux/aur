# Maintainer: czyt <czytcn@gmail.com>
pkgname=yetease-music-bin
pkgver=0.2.14
pkgrel=1
pkgdesc="A fast, clean third-party NetEase Cloud Music client — Rust core × Flutter UI (Linux-first)"
arch=(x86_64)
url="https://github.com/Gloridust/YetEaseMusic"
license=(MIT)
depends=(gtk3 alsa-lib ca-certificates)
provides=(yetease-music)
conflicts=(yetease-music)
options=(!strip !debug)

_deb="yetease-music_${pkgver}_amd64.deb"
source_x86_64=("${_deb}::https://github.com/Gloridust/YetEaseMusic/releases/download/v${pkgver}/${_deb}")
sha256sums_x86_64=('7eeabb985b333730f6b0223b214171188a1da293e0a85357af610ffa0e78b12e')
noextract=("${_deb}")

package() {
    # Dynamic member lookup: do not assume a fixed compression format
    bsdtar -xOf "${srcdir}/${_deb}" "data.tar.*" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    # Upstream ships the license as a Debian copyright file
    install -Dm644 "${pkgdir}/usr/share/doc/yetease-music/copyright" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
