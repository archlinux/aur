# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apifox-bin
_pkgname=Apifox
pkgver=2.3.17
pkgrel=1
pkgdesc="Apifox=Postman+Swagger+Mock+JMeter.API 文档、API 调试、API Mock、API 自动化测试"
arch=('aarch64' 'x86_64')
url="https://apifox.com/"
_githuburl="https://github.com/apifox/apifox"
license=('custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('gtk3' 'lib32-gcc-libs' 'nss' 'at-spi2-core' 'java-runtime' 'alsa-lib' 'libxdamage' 'expat' 'cairo' 'libx11' 'dbus' \
  'nspr' 'libxrandr' 'lib32-glibc' 'libxext' 'gcc-libs' 'libxcomposite' 'libxcb' 'glib2' 'libcups' 'libdrm' 'glibc' 'libxkbcommon' \
  'libxfixes' 'hicolor-icon-theme' 'pango' 'mesa' 'sh')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::https://cdn.apifox.cn/download/${_pkgname}-linux-arm64-deb-latest.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::https://cdn.apifox.cn/download/${_pkgname}-linux-deb-latest.zip")
source=("LICENSE.html")
sha256sums=('3884df6451dd5aaadc867c2b6882a7feabccb10c7e1df98e48e9fe2414c9fe19')
sha256sums_aarch64=('35b7d6364491d01bbd5b0b676d6b1ad860e2de90075b86a402b9175d95fdb6e3')
sha256sums_x86_64=('a9173215bee9b8448ef100e9f6eb23d33e1f49daa61a434ac4cb0ef0dcc99695')
build() {
    bsdtar -xf "${pkgname%-bin}_${pkgver}_"*.deb
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin} %U|g;s|Utility|Development;Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}