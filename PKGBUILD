# Maintainer: yeah <yeah_yaojiu@163.com>
pkgname=eudic-ting-en-bin
_pkgname=ting-en
pkgver=26.1.2
pkgrel=1
pkgdesc="Eudic Daily English Listening (欧路软件 每日听力)"
arch=('x86_64')
url="https://www.eudic.cn"
license=('custom')
depends=(
    'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 
    'at-spi2-core' 'util-linux-libs' 'libsecret' 'alsa-lib'
)
optdepends=('libappindicator-gtk3: Tray icon support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/ting_en/ting_en.deb?ver=26.6.2&date=Thursday%2c+July+2%2c+2026"
    "LICENSE.html::https://www.eudic.net/v4/en/home/UserLicense"
    "PrivacyPolicy.html::https://www.eudic.net/v4/en/home/privacy"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')
options=(!debug !strip)

package() {

    tar -xf data.tar.xz -C "${pkgdir}"

    mv "${pkgdir}/opt/每日英语听力" "${pkgdir}/opt/${_pkgname}"
    if [ -f "${pkgdir}/usr/share/applications/ting_en.desktop" ]; then
        sed -i "s|/opt/每日英语听力|/opt/${_pkgname}|g" "${pkgdir}/usr/share/applications/ting_en.desktop"
    fi

    if [ -f "${pkgdir}/opt/${_pkgname}/chrome-sandbox" ]; then
        chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
    fi

    install -d "${pkgdir}/usr/bin"
    
    ln -sf "/opt/${_pkgname}/ting_en" "${pkgdir}/usr/bin/ting_en"

    install -Dm644 LICENSE.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    install -Dm644 PrivacyPolicy.html "${pkgdir}/usr/share/licenses/${pkgname}/PrivacyPolicy.html"
}
