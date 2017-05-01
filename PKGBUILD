# Maintainer: NexAdn
pkgname=cef-minimal
pkgver=3.3029.1611
_commit=g44e39a8
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
    "978bbab25a8f8f49bb9dc268a15ba7a2f1bdc2fb048d1d3dfb4a3f33840da3a9"
)
sha256sums_x86_64=(
    "251c513d48e32163ab1cf804660d360ca4a5152ad2980e1b6bbad26e8e8ddcf0"
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
