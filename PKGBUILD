# Maintainer: MrGodzilla38 <oyunustasigodzilla@gmail.com>
pkgname=rivalcfg-gui
pkgver=1.2.1
pkgrel=1
pkgdesc="GTK3 GUI configuration tool for SteelSeries mice (via rivalcfg)"
arch=('any')
url="https://github.com/MrGodzilla38/rivalcfg-gui"
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'python-cairo')
optdepends=('rivalcfg: SteelSeries CLI tool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MrGodzilla38/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6f3fdd335bae4281384dbafa7e863d923ea517a8bdaad6562295e7f47bffeb5b')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install application files
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -Dm755 rivalcfg_gui.py "${pkgdir}/usr/share/${pkgname}/rivalcfg_gui.py"
    install -Dm644 logo.png "${pkgdir}/usr/share/${pkgname}/logo.png"
    install -Dm644 rival3.png "${pkgdir}/usr/share/${pkgname}/rival3.png"

    # Install locale files
    install -d "${pkgdir}/usr/share/${pkgname}/locales"
    cp -r locales/* "${pkgdir}/usr/share/${pkgname}/locales/"

    # Create symlink
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/rivalcfg_gui.py" "${pkgdir}/usr/bin/${pkgname}"

    # Create desktop entry
    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=RivalCFG GUI
Comment=SteelSeries mouse configuration tool
Exec=/usr/share/${pkgname}/rivalcfg_gui.py
Icon=/usr/share/${pkgname}/logo.png
Terminal=false
Categories=Utility;Settings;
StartupWMClass=rivalcfg_gui.py
EOF
}
