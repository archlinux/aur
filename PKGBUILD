# Contributor: Ayatale  <ayatale@qq.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pplink-bin
pkgver=11.1.0
pkgrel=1
pkgdesc="帮助电脑、手机、平板等设备建立点到点的安全直连"
arch=('x86_64')
url="https://www.ppzhilian.com"
license=('custom')
depends=('bash' 'electron25' 'libxfixes' 'glibc' 'libx11' 'gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/download/linux/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.md::https://www.ppzhilian.com/article?url=articles/en-US/privacy.md"
    "${pkgname%-bin}.sh")
sha256sums=('b5d3182417621010143aa56d624d717fea3336725e6d8575d25fd45f97ef3f0b'
            'afaf32aeb7a4ddd2ae4a30f28878a41d84e795abb63c9f06513d69be1a7ac945'
            '40e105412e5a8b2c95affcc26a3bcfd8320c67bf7fbd690719453cec5bda1258')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/pp直连/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|\"/opt/pp直连/pplink\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}