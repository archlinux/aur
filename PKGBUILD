# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="electrocrud-bin"
pkgver=3.0.19
pkgrel=1
pkgdesc="Database CRUD Application Built on Electron | MySQL, Postgres, SQLite"
arch=('x86_64')
url="http://garrylachman.github.io/ElectroCRUD/"
_githuburl="https://github.com/garrylachman/ElectroCRUD"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('gcc-libs' 'libdrm' 'libxcomposite' 'mesa' 'expat' 'at-spi2-core' 'bash' 'libxfixes' 'libxcb' 'pango' 'libxdamage' \
    'gtk3' 'libxkbcommon' 'nspr' 'libxext' 'glib2' 'cairo' 'alsa-lib' 'libxrandr' 'libx11' 'nss' 'glibc' 'libcups' 'dbus')
source=("${pkgname%-appimage}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/ElectroCRUD-v${pkgver}-linux-x64.deb"
    "LICENSE::https://raw.githubusercontent.com/garrylachman/ElectroCRUD/master/LICENSE")
sha256sums=('bf4a06ae87285d204eb387318fa84e736d6b2bcc03ae37d6178fdc4de689f65f'
            '5e98c15fe806a18f79422d2cd0c4587129f4e03081b5ab4c030627d6f6840d68')

package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -r "${srcdir}/usr/share/"* "${pkgdir}/usr/share"
    sed "s|Exec=${pkgname%-bin}|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}