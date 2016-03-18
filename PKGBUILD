# Upstream: RuneScape Linux <noreply@jagex.com>
# Maintainer: Ivan Puntiy <ivan.puntiy-at-gmail>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=runescape-launcher
pkgver=2.1.3
pkgrel=1
pkgdesc="RuneScape Game Client"
arch=(x86_64)
license=(custom)
url="https://www.runescape.com/"
depends=(
    glew1.10
    libcurl-compat
    libpng12
    libvorbis
    sdl2
    webkitgtk2
    desktop-file-utils
    gtk-update-icon-cache
)
conflicts=(runescape-launcher-nxt)
provides=(runescape-launcher-nxt)
install=$pkgname.install
source=("wrapper.sh")
source_x86_64=("https://content.runescape.com/downloads/ubuntu/pool/non-free/r/$pkgname/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('d20151c9111a77e753954638eb60f1b4ec0d2c86e173041dcd95bb7b309d5b12')
sha256sums_x86_64=('8909b1026b956623a3f4f06e55d7ad287d46e188d90deac9b52735bd2a5703f7')

prepare() {
    mkdir -p "$srcdir/$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"

    bsdtar xf ../control.tar.gz
    bsdtar xf ../data.tar.xz
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    cp -a usr "$pkgdir"

    mv "$pkgdir"/usr/bin/runescape-launcher{,.real}

    install -Dm0755 ../wrapper.sh "$pkgdir"/usr/bin/runescape-launcher
    install -Dm0644 copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: ft=sh:ts=4:sw=4:et:nowrap
