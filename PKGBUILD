# Maintainer: Mikhail Velichko  <efklid@gmail.com>



_pkgname=browser-stable
pkgname=yandex-browser
pkgver=22.5.0.1878_1
_pkgver=22.5.0.1878-1
pkgrel=1
#epoch=1

pkgdesc="The web browser from Yandex.
 Yandex Browser is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier."
arch=("x86_64")
url='https://browser.yandex.com/'
license=("custom:yandex-browser")
categories=("network")

options=(!strip)

depends=( "binutils" "curl" "ttf-liberation" "jq" "alsa-lib" "libcurl-compat" "libcurl-gnutls" "gtk2" "gtk3" "gtk4" "snappy" "opus" "flac" "harfbuzz-icu" "nss"
"libxss" "libxkbfile" "wget" "xdg-utils" "polkit" "dbus-glib" "python" )
optdepends=(
    "speech-dispatcher"
    "vulkan-driver"
    "vulkan-icd-loader"
    "ttf-font"
    "cryptopro-csp-k1"
)

source=("${pkgname}-${pkgver}.deb::http://repo.yandex.ru/yandex-browser/deb/pool/main/y/yandex-${_pkgname}/yandex-${_pkgname}_${_pkgver}_amd64.deb")
sha256sums=("49c8da3138279f0ef1c3659a3d1b9b5afb3d7765346212f5a5c95ae7ee2b0967")
install=yandex-browser.install

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
# The stable version uses the "browser" folder in /opt/yandex. ${_pkgname} cannot be used in this section for the stable branch 
    install -D -m0644 "${pkgdir}"/opt/yandex/browser/product_logo_128.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
    chmod 4755 "${pkgdir}"/opt/yandex/browser/yandex_browser-sandbox
}
