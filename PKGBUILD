# Maintainer: NexAdn <nexadn@yandex.com>
pkgname=cef-minimal
pkgver=3.3029.1613
_commit=g22354a9
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
    "1bc4f57c5eddcb80c6554db0e4c881585411b728f05208e57a37440d877a5871"
)
sha256sums_x86_64=(
    "fc57b84cda996ab3cb0d5657292361942be6b37c3395f9ad911dbb3f47a02d37"
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
