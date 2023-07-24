# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="miteiru-bin"
pkgver=1.2.1
pkgrel=1
pkgdesc="An open source Electron video player to learn Japanese. It has main language dictionary and tokenizer (morphological analyzer), heavily based on External software MeCab"
arch=('x86_64')
url="https://github.com/hockyy/miteiru"
license=(custom)
depends=('bash' 'zlib' 'electron21' 'hicolor-icon-theme' 'glibc' 'gcc-libs' 'expat' 'lib32-gcc-libs' 'lib32-glibc' 'mecab')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.md::https://raw.githubusercontent.com/hockyy/miteiru/main/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('5413ff61c626b9f5c3fa75f4ef4a587704071c16b67b7b0bf6b463c07521c521'
            '32b8056672bc415bbd3829a9a737d776795f6b73af61ce0934107ed81ee8a7a0'
            'df117d451c5c7fb4ca99920810b23d98ba1bd986501be11194eab27841962b18')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}