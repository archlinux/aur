# Maintainer: huochenghai <huochenghai@gmail.com>
_basepkgname="chat-gpt-next-web"
pkgname=${_basepkgname}-bin
pkgver="2.13.1"
pkgrel=1
pkgdesc="A cross-platform ChatGPT/Gemini UI (Web / PWA / Linux / Win / MacOS). 一键拥有你自己的跨平台 ChatGPT/Gemini 应用。"
arch=("x86_64")
url="https://app.nextchat.dev/"
_githuburl="https://github.com/ChatGPTNextWeb/ChatGPT-Next-Web"
makedepends=("binutils"
    "tar")
depends=(webkit2gtk gtk3 gdk-pixbuf2 glib2 openssl hicolor-icon-theme libsoup gcc-libs glibc pango cairo)
provides=("${pkgname}-${pkgver}")
conflicts=("${pkgname}" "${_basepkgname}" "next-chat-bin" "next-chat")
license=("MIT")
source=("${pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/next-chat_${pkgver}_amd64.deb"
    'LICENSE::https://raw.githubusercontent.com/ChatGPTNextWeb/ChatGPT-Next-Web/main/LICENSE')
sha256sums=('f192f0c0628a6ea7c79b27896e81e00b23d6ec213d40b2eb6203eb3da5e520d2'
    'edc5ddb0ceb70e4c76021ddb6d17bb8f1bc59b03228bb17a7acfcf8a1b4afd99')

prepare() {
    ar p ${pkgname}-${pkgver}.deb data.tar.gz | tar --zstd -x
}

package() {
    cd $srcdir
    cp -R usr ${pkgdir}
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
