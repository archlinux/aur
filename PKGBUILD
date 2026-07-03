# Maintainer: Stezko <stezko@gmail.com>

_pkgname=yandex-browser
pkgname=yandex-browser-corporate
pkgver=26.4.4.966
_pkgver=26.4.4.966-1
pkgrel=1

pkgdesc="The web browser from Yandex.
 Yandex Browser is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier."
arch=("x86_64")
url='https://browser.yandex.com/'
license=("custom:yandex-browser")
categories=("network")
provides=(yandex-browser-corporate)
conflicts=('yandex-browser' 'yandex-browser-beta')

depends=("binutils" "ttf-liberation" "jq" "alsa-lib" "at-spi2-atk" "curl" "dbus" "expat" "libcups" "mesa" "gtk4" "nss" "squashfs-tools" "wget" "xdg-utils"
"vulkan-icd-loader" "libxcomposite")
optdepends=("speech-dispatcher" "gstreamer-meta" "cryptopro-csp-k1")

source=("${pkgname}-${_pkgver}.deb::https://repo.yandex.ru/${_pkgname}/deb/pool/main/y/${pkgname}/${pkgname}_${_pkgver}_amd64.deb")
#        "wayland.patch")
sha256sums=("6ec9faa7559c012126f37ddf084a03dac36ce0deb7306162f637a657864ef8ce")
#            "86e4267e8b08e66d2227db41afe1b3d301f14579a76c9664e29645a49c26664d")
install=${pkgname}.install

prepare() {
    tar -xf data.tar.xz
#    patch -p1 < "${srcdir}/wayland.patch"
}

package() {
    cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
    chmod 4755 "${pkgdir}"/opt/yandex/browser/yandex_browser-sandbox
}
