# Maintainer: huochenghai <huochenghai@gmail.com>
_basepkgname="chat-gpt-next-web"
pkgname=${_basepkgname}-bin
pkgver="2.9.12"
pkgrel=1
pkgdesc="A well-designed cross-platform ChatGPT UI (Web / PWA / Linux / Win / MacOS). 一键拥有你自己的跨平台 ChatGPT 应用。"
arch=("x86_64")
url="https://a.nextweb.fun/"
_githuburl="https://github.com/Yidadaa/ChatGPT-Next-Web"
makedepends=("binutils"
    "tar")
depends=(webkit2gtk gtk3 gdk-pixbuf2 glib2 openssl hicolor-icon-theme libsoup gcc-libs glibc pango cairo)
provides=("${pkgname}-${pkgver}")
conflicts=("${pkgname}" "${_basepkgname}-bin")
license=("MIT")
source=("${pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_basepkgname}_${pkgver}_amd64.deb"
    'LICENSE::https://raw.githubusercontent.com/Yidadaa/ChatGPT-Next-Web/main/LICENSE')
sha256sums=('675fe1773283ccbb0a8ba68c1256542d607e76b317e6302f29ff1e1a23ce6bec'
    'c840d06dc375a0003fd2a080b0d6be6afd958a1f5f637bfb00bd0c13ddfd2987')

prepare() {
    ar p ${pkgname}-${pkgver}.deb data.tar.gz | tar --zstd -x
}

package() {
    cd $srcdir
    cp -R usr ${pkgdir}
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
