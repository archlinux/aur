# Maintainer: sniper1720 (Djalel Oukid) <sniper1720@linuxtechmore.com>
pkgname=ltmnight-sddm-theme
pkgver=1.2.4
pkgrel=1
pkgdesc="A premium, modern SDDM theme with LTMNight styling and animated backgrounds"
arch=('any')
url="https://github.com/hyprltm/ltmnight-sddm-theme"
license=('AGPL3')
depends=('sddm' 'qt6-declarative' 'qt6-svg' 'qt6-virtualkeyboard' 'qt6-multimedia-ffmpeg' 'ttf-jetbrains-mono')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ac07374f22a7a2cb017798c676ab6bd7e9dd9bea1d8edceeea0409d5a2b9fa3a')

install=ltmnight-sddm-theme.install

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # 1. Install Theme Files
    install -d "${pkgdir}/usr/share/sddm/themes/ltmnight"
    cp -r Assets Backgrounds Components Themes i18n Previews Main.qml metadata.desktop \
        "${pkgdir}/usr/share/sddm/themes/ltmnight/"

    # 2. Install "setup.sh" as an internal helper
    install -Dm755 setup.sh "${pkgdir}/usr/share/sddm/themes/ltmnight/setup.sh"

    # 3. Create the "/usr/bin/ltmnight-sddm-configurator" symlink
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/share/sddm/themes/ltmnight/setup.sh" "${pkgdir}/usr/bin/ltmnight-sddm-configurator"
}
