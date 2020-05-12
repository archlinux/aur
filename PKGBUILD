# Maintainer: Alice Gaudon <alice at gaudon dot pro>
# Contributor: NexAdn <nexadn at yandex dot com>
pkgname=cef-minimal-3770
pkgver=75.1.14
_pkgver="75.1.14+gc81164e+chromium-75.0.3770.100"
_url_pkgver="75.1.14%2Bgc81164e%2Bchromium-75.0.3770.100"
pkgrel=2
pkgdesc="Chromium Embedded Framework minimal release"
arch=("i686" "x86_64")
url="https://bitbucket.org/chromiumembedded/cef"
license=("BSD")
depends=("nss" "alsa-lib" "libxss" "libxtst" "libglvnd" "pango" "libxcursor" "dbus" "libxrandr" "libxcomposite" "at-spi2-atk")
makedepends=("cmake" "make")
provides=("${pkgname%-*}=$pkgver" "cef=$pkgver")
conflicts=("${pkgname%-*}" "cef")
source_i686=(
    "http://opensource.spotify.com/cefbuilds/cef_binary_${_url_pkgver}_linux32_minimal.tar.bz2"
)
source_x86_64=(
    "http://opensource.spotify.com/cefbuilds/cef_binary_${_url_pkgver}_linux64_minimal.tar.bz2"
)
sha1sums_i686=('d559425e624cf937a9523dcd32378ef85383d1ac')
sha1sums_x86_64=('89f7af789e6d40eb449f38c1789ad4d1d701d079')
[[ "$CARCH" = "i686" ]] && _arch="32"
[[ "$CARCH" = "x86_64" ]] && _arch="64"
build() {
    cd "$srcdir"/cef_binary_${_pkgver}_linux${_arch}_minimal
    sed -i 's/-Werror/#-Werror/g' cmake/cef_variables.cmake
    cmake .
    make libcef_dll_wrapper
}
package() {
    mkdir -p "$pkgdir"/opt/cef/
    cp -R "$srcdir"/cef_binary_${_pkgver}_linux${_arch}_minimal/* "$pkgdir"/opt/cef
    install -Dm644 "$srcdir"/cef_binary_${_pkgver}_linux${_arch}_minimal/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
