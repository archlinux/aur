# Maintainer: Mikhail Velichko  <efklid@gmail.com>

_pkgname=browser-stable
pkgname=yandex-browser
pkgver=26.3.1.1088
_pkgver=26.3.1.1088-1
pkgrel=3
#epoch=1

pkgdesc="The web browser from Yandex.
 Yandex Browser is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier."
arch=("x86_64")
url='https://browser.yandex.com/'
license=("custom:yandex-browser")
categories=("network")
provides=(yandex-browser)
conflicts=("yandex-browser" "yandex-browser-stable" "yandex-browser-corporate")

depends=("binutils" "ttf-liberation" "jq" "alsa-lib" "at-spi2-atk" "curl" "dbus" "expat" "libcups" "mesa" "gtk4" "nss" "squashfs-tools" "wget" "xdg-utils"
"vulkan-icd-loader" "libxcomposite")

optdepends=(
    "speech-dispatcher" 
    "gstreamer-meta"
    "cryptopro-csp-k1"
)

source=("${pkgname}-${_pkgver}.deb::https://repo.yandex.ru/yandex-browser/deb/pool/main/y/yandex-${_pkgname}/yandex-${_pkgname}_${_pkgver}_amd64.deb"
        "wayland.patch")
sha256sums=("8af56b588c48f2965386886f98ae9f95b98c8b5f1c20847b06f7cb2cd2932ba0"
            "d6f046ae71d97f00233cd2e827a76bcfd74e7a3896f4d299e25c6324b53f19e2")
install=yandex-browser.install

prepare() {
    tar -xf data.tar.xz
    patch -p1 < "${srcdir}/wayland.patch"
}

package() {
    cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
# The stable version uses the "browser" folder in /opt/yandex. ${_pkgname} cannot be used in this section for the stable branch 
#    install -D -m0644 "${pkgdir}"/opt/yandex/browser/product_logo_128.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
    chmod 4755 "${pkgdir}"/opt/yandex/browser/yandex_browser-sandbox
}
