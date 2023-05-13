# Maintainer : jaltek <jaltek(at)mailbox(dot)org>
# Maintainer : Matthieu Froment <thieume(at)mailoo(dot)org>
# Contributor : Xunhua Guo <xunhua(dot)guo(at)gmail(dot)com>
# Contributor : Robert Orzanna <orschiro(at)gmail(dot)com>
# Contributor : Cassfalg <ch(dot)assfalg(at)gmx(dot)de>

pkgname=teamdrive
pkgver=5.0.2.3307
pkgrel=1
pkgdesc="Keeps data synchronised between various computers automatically."
arch=('x86_64')
url="http://www.teamdrive.com/"
license=('CUSTOM')
#depends=('')

source=(teamdrive.desktop)
dir=$(echo $pkgver|cut -d. -f1,2,4)

#source_x86_64=("https://download.teamdrive.net/${dir}/TMDR/linux-x86_64/Install-TeamDrive-${pkgver}_TMDR.run")
source_x86_64=("https://download.teamdrive.net/${pkgver}/TMDR/linux-x86_64/Install-TeamDrive-${pkgver}_TMDR.run")


sha256sums=('b81c4e2573b8478ce69a0ba66f5a493ecd73dbb8a94fe92fa33b1f5f14b8fb2c')
sha256sums_x86_64=('ea6ee7751540521ab74c975b37978fa0b8aaf28b33a9ca6221a5f15d6f3d3519')

options=(!strip)

build() {
    cd ${srcdir}
    chmod +x Install-TeamDrive-${pkgver}_TMDR.run
}

package() {
    ./Install-TeamDrive-${pkgver}_TMDR.run --mode unattended --prefix ${pkgdir}/opt/${pkgname}
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    rm -f "${pkgdir}/opt/${pkgname}/Uninstall TeamDrive.desktop"
    rm -f "${pkgdir}/opt/${pkgname}/uninstall"
}

