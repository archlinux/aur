# Contributor: Ayatale  <ayatale@qq.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pplink-bin
pkgver=11.0.0
pkgrel=1
pkgdesc="帮助电脑、手机、平板等设备建立点到点的安全直连"
arch=('x86_64')
url="https://www.ppzhilian.com"
license=('custom')
depends=('libxtst' 'libxfixes' 'nspr' 'nss' 'glibc' 'hicolor-icon-theme' 'cairo' 'alsa-lib' 'libxkbcommon' 'nodejs' 'libcups' \
    'python' 'at-spi2-core' 'libdrm' 'libxext' 'glib2' 'gcc-libs' 'libx11' 'libxcb' 'libxdamage' 'mesa' 'libxrandr' 'expat' \
    'sh' 'dbus' 'gtk3' 'pango' 'zlib' 'libxcomposite')
provides=()
options=('!strip' 'emptydirs')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/download/linux/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.md::https://www.ppzhilian.com/article?url=articles/en-US/privacy.md")
sha256sums=('99556a46e099be5124e8c21132e0ddf3476f8f7a6b39cece014828a70df1fa81'
            '04f80e479b88305d9d4b7e7a2d1f86c1507df2f4ca6e887e1acf95d38d61f3c5')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    mv "${pkgdir}/opt/pp直连" "${pkgdir}/opt/${pkgname%-bin}"
    sed 's|/opt/pp直连|/opt/pplink|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}