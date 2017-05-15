# Upstream: RuneScape Linux <noreply@jagex.com>
# Maintainer: Ivan Puntiy <ivan.puntiy-at-gmail>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=runescape-launcher
pkgver=2.2.4
pkgrel=1
_pkgbump=5
pkgdesc="RuneScape Game Client (NXT)"
arch=(x86_64)
license=(custom)
url="https://www.runescape.com/"
depends=(
    glew1.10
    libcurl-compat
    libpng12
    libvorbis
    sdl2
)
conflicts=(runescape-launcher-nxt)
provides=(runescape-launcher-nxt)
source=("wrapper.sh")
source_x86_64=("${pkgname}_${pkgver}-${_pkgbump}_amd64.deb::https://content.runescape.com/downloads/ubuntu/pool/non-free/r/$pkgname/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('d20151c9111a77e753954638eb60f1b4ec0d2c86e173041dcd95bb7b309d5b12')
sha256sums_x86_64=('3aa5cb2189c8ee0f2c95da1229b3fc30cacb1209ff794afc77ddb218684386df')

prepare() {
    mkdir -p "$srcdir/$pkgname-$pkgver-$_pkgbump"
    cd "$srcdir/$pkgname-$pkgver-$_pkgbump"

    bsdtar xf ../control.tar.gz
    bsdtar xf ../data.tar.xz
}

package() {
    cd "$srcdir/$pkgname-$pkgver-$_pkgbump"

    cp -a usr "$pkgdir"

    mv "$pkgdir"/usr/bin/runescape-launcher{,.real}

    install -Dm0755 ../wrapper.sh "$pkgdir"/usr/bin/runescape-launcher
    install -Dm0644 copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: ft=sh:ts=4:sw=4:et:nowrap
