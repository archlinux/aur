# Upstream: RuneScape Linux <noreply@jagex.com>
# Maintainer: Ivan Puntiy <ivan.puntiy-at-gmail>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=runescape-launcher
pkgver=2.2.2
pkgrel=7
_pkgbump=23
pkgdesc="RuneScape Game Client (NXT)"
arch=(x86_64)
license=(custom)
url="https://www.runescape.com/"
depends=(
    glew1.10
    libcurl-compat
    libpng12
    gst-plugins-base
    sdl2
    webkitgtk2
)
conflicts=(runescape-launcher-nxt)
provides=(runescape-launcher-nxt)
source=("wrapper.sh")
source_x86_64=("${pkgname}_${pkgver}-${_pkgbump}_amd64.deb::https://content.runescape.com/downloads/ubuntu/pool/non-free/r/$pkgname/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('d20151c9111a77e753954638eb60f1b4ec0d2c86e173041dcd95bb7b309d5b12')
sha256sums_x86_64=('7ee23c2e90b11a54ed480f9d83b5ed0dbe3ba09ccc93eead64f0c8cc2febdd35')
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
