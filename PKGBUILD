# Maintainer: huochenghai <huochenghai@gmail.com>
_basepkgname="chat-gpt-next-web"
pkgname=${_basepkgname}-bin
pkgver="2.10.3"
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
sha256sums=('cf7c34a569560b61ca1365c2f0568bd82164484b4b042f1576a5f3b56562481a'
    'c840d06dc375a0003fd2a080b0d6be6afd958a1f5f637bfb00bd0c13ddfd2987')

prepare() {
    ar p ${pkgname}-${pkgver}.deb data.tar.gz | tar --zstd -x
}

package() {
    cd $srcdir
    cp -R usr ${pkgdir}
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
