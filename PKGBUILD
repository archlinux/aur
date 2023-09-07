# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cpeditor-bin
pkgver=6.10.3
pkgrel=2
pkgdesc="The IDE for competitive programming Fetch, Code, Compile, Run, Check, Submit"
arch=("x86_64")
url="https://cpeditor.org/"
_githuburl="https://github.com/cpeditor/cpeditor"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=('xcb-util-image' 'qt5-base' 'libxkbcommon-x11' 'xcb-util-wm' 'qt5-svg' 'xcb-util' 'xcb-util-keysyms' 'xcb-util-renderutil' 'libxext' \
    'zlib' 'libgpg-error' 'freetype2' 'glibc' 'libx11' 'e2fsprogs' 'bash' 'fontconfig' 'libxkbcommon' 'libglvnd' 'gcc-libs' 'libxcb')
optdepends=(
    'cf-tool: submit to Codeforces'
    'clang: C++ format and language server'
    'java-environment: compile Java'
    'java-runtime: execute Java'
    'python: execute Python'
    'wakatime: track coding stats'
)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.deb")
sha256sums=('47ce8cd065753557d04270dcd32d2bc8b737e3ce8a9a48e59017c0e0f4786a33')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|usr/share|opt|g" -i "${srcdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}