# Maintainer: NexAdn <nexadn@yandex.com>
pkgname=cef-minimal
pkgver=3.3071
_subver_i686=1639.g96f7e9
_subver_x86_64=1636.g2718da5
pkgrel=1
pkgdesc="Chromium Embedded Framework minimal release"
arch=("i686" "x86_64")
url="https://bitbucket.org/chromiumembedded/cef"
license=("BSD")
depends=("nss" "alsa-lib" "atk" "gconf" "pango" "libxrandr" "libxcursor" "libxss" "libxtst" "libxcomposite")
makedepends=("cmake" "make")
source_i686=(
    "http://opensource.spotify.com/cefbuilds/cef_binary_${pkgver}.${_subver_i686}_linux32_minimal.tar.bz2"
)
source_x86_64=(
    "http://opensource.spotify.com/cefbuilds/cef_binary_${pkgver}.${_subver_x86_64}_linux64_minimal.tar.bz2"
)
sha256sums_i686=(
    "9956ca56064596f1dc36a5ee4a6cba8829ae7042356ef167f86718142387379c"
)
sha256sums_x86_64=(
    "5c5475d4ff16951bc2443ed1bc6d7586d13cf40707580cc27fb20458e3d15055"
)
[[ "$CARCH" = "i686" ]] && _arch="32" && _subver=$_subver_i686
[[ "$CARCH" = "x86_64" ]] && _arch="64" && _subver=$_subver_x86_64
build() {
    cd "$srcdir"/cef_binary_${pkgver}.${_subver}_linux${_arch}_minimal
    sed '/^add_subdirectory[\(]tests[\/].*/d' -i CMakeLists.txt
    cmake .
    make clean
    make -j4 libcef_dll_wrapper
}
package() {
    mkdir -p "$pkgdir"/opt/cef-minimal/
    cp -R "$srcdir"/cef_binary_${pkgver}.${_subver}_linux${_arch}_minimal/* "$pkgdir"/opt/cef-minimal
    install -Dm644 "$srcdir"/cef_binary_${pkgver}.${_subver}_linux${_arch}_minimal/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
