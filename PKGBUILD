# Maintainer: Mikhail Velichko  <efklid@gmail.com>

_pkgname=browser-stable
pkgname=yandex-browser
pkgver=25.4.1.1213
_pkgver=25.4.1.1213-1
pkgrel=1
#epoch=1

pkgdesc="The web browser from Yandex.
 Yandex Browser is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier."
arch=("x86_64")
url='https://browser.yandex.com/'
license=("custom:yandex-browser")
categories=("network")
provides=(yandex-browser)
conflicts=("yandex-browser" "yandex-browser-stable" "yandex-browser-corporate")

depends=( "binutils" "ttf-liberation" "jq" "alsa-lib" "at-spi2-atk" "libcups" "curl" "dbus" "mesa" "gdbm" "gtk4" "nspr" "nss" "pango"
"wayland" "libxcomposite" "libxdamage" "libxkbcommon" "libxkbfile" "libxrandr" "squashfs-tools" "wget" "xdg-utils" "harfbuzz-icu"
"vulkan-driver" "vulkan-icd-loader" "ffmpeg")
optdepends=(
    "speech-dispatcher" 
    "gstreamer-meta"
    "cryptopro-csp-k1"
)

source=("${pkgname}-${_pkgver}.deb::https://repo.yandex.ru/yandex-browser/deb/pool/main/y/yandex-${_pkgname}/yandex-${_pkgname}_${_pkgver}_amd64.deb")
sha256sums=("4384e2f1e9f5f01309f0701787c648924ea90a290438c3abd8940b72dd078377")
install=yandex-browser.install

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
# The stable version uses the "browser" folder in /opt/yandex. ${_pkgname} cannot be used in this section for the stable branch 
#    install -D -m0644 "${pkgdir}"/opt/yandex/browser/product_logo_128.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
    chmod 4755 "${pkgdir}"/opt/yandex/browser/yandex_browser-sandbox
}
