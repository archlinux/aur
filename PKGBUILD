# Maintainer: huochenghai <huochenghai@gmail.com>
_basepkgname="chat-gpt-next-web"
pkgname=${_basepkgname}-bin
pkgver="2.15.8"
pkgrel=2
pkgdesc="✨ Light and Fast AI Assistant. Support: Web | iOS | MacOS | Android | Linux | Windows"
arch=("x86_64")
url="https://nextnext.chat/"
_githuburl="https://github.com/ChatGPTNextWeb/NextChat/"
makedepends=("binutils"
    "tar")
depends=(webkit2gtk gtk3 gdk-pixbuf2 glib2 openssl hicolor-icon-theme libsoup gcc-libs glibc pango cairo)
provides=("${pkgname}-${pkgver}")
conflicts=("${pkgname}" "${_basepkgname}" "next-chat-bin" "next-chat")
license=("MIT")
source=("${pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/next-chat_${pkgver}_amd64.deb"
    'LICENSE::https://raw.githubusercontent.com/ChatGPTNextWeb/NextChat/refs/heads/main/LICENSE')
sha256sums=('8820d8366f5c7b3d4457c9b2ed9099c4bd72f078e56da1c54489c71568c9e1e8'
    'abe83c6910b9437f7342b2184c213678b4adbb191d323e0244336039abbccc01')

prepare() {
    ar p ${pkgname}-${pkgver}.deb data.tar.gz | tar --zstd -x
}

package() {
    cd $srcdir
    cp -R usr ${pkgdir}
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
