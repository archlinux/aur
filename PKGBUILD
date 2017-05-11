# Maintainer: NexAdn <nexadn@yandex.com>
pkgname=cef-minimal
pkgver=3.3029.1615
_commit=g753baf1
pkgrel=1
pkgdesc="Chromium Embedded Framework minimal release"
arch=("i686" "x86_64")
url="https://bitbucket.org/chromiumembedded/cef"
license=("BSD")
depends=("nss" "alsa-lib" "atk" "gconf" "pango" "libxrandr" "libxcursor" "libxss" "libxtst" "libxcomposite")
makedepends=("cmake" "make")
source_i686=(
    "http://opensource.spotify.com/cefbuilds/cef_binary_${pkgver}.${_commit}_linux32_minimal.tar.bz2"
)
source_x86_64=(
    "http://opensource.spotify.com/cefbuilds/cef_binary_${pkgver}.${_commit}_linux64_minimal.tar.bz2"
)
sha256sums_i686=(
    "6b02389c15648fa8ec905d294c61962f6e9380ece5c8a669d58ca9071bd21096"
)
sha256sums_x86_64=(
    "29881536e683a25fe69b79a7a91625fa4a366f14f32efbb65b10203609277091"
)
[[ "$CARCH" = "i686" ]] && _arch="32"
[[ "$CARCH" = "x86_64" ]] && _arch="64"
build() {
    cd "$srcdir"/cef_binary_${pkgver}.${_commit}_linux${_arch}_minimal
    sed '/^add_subdirectory[\(]tests[\/].*/d' -i CMakeLists.txt
    cmake .
    make clean
    make -j4 libcef_dll_wrapper
}
package() {
    mkdir -p "$pkgdir"/opt/cef-minimal/
    cp -R "$srcdir"/cef_binary_${pkgver}.${_commit}_linux${_arch}_minimal/* "$pkgdir"/opt/cef-minimal
    install -Dm644 "$srcdir"/cef_binary_${pkgver}.${_commit}_linux${_arch}_minimal/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
