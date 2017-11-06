# Maintainer: NexAdn <nexadn@yandex.com>
pkgname=cef-minimal
pkgver=3.3202
_subver_i686=1681.g9672a06
_subver_x86_64=${_subver_i686}
pkgrel=2
pkgdesc="Chromium Embedded Framework minimal release"
arch=("i686" "x86_64")
url="https://bitbucket.org/chromiumembedded/cef"
license=("BSD")
depends=("nss" "alsa-lib" "gconf" "libxss" "libxtst" "gtk2")
makedepends=("cmake" "make")
provides=("cef")
source_i686=(
    "http://opensource.spotify.com/cefbuilds/cef_binary_${pkgver}.${_subver_i686}_linux32_minimal.tar.bz2"
)
source_x86_64=(
    "http://opensource.spotify.com/cefbuilds/cef_binary_${pkgver}.${_subver_x86_64}_linux64_minimal.tar.bz2"
)
sha1sums_i686=('7f7fb1df2337b3a117dc186b740eac380680028c')
sha1sums_x86_64=('bde2f9193bddd992d60311770d7bef7c5e942898')
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
    mkdir -p "$pkgdir"/opt/cef/
    cp -R "$srcdir"/cef_binary_${pkgver}.${_subver}_linux${_arch}_minimal/* "$pkgdir"/opt/cef
    install -Dm644 "$srcdir"/cef_binary_${pkgver}.${_subver}_linux${_arch}_minimal/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
