# Maintainer : jaltek <jaltek(at)mailbox(dot)org>
# Maintainer : Matthieu Froment <thieume(at)mailoo(dot)org>
# Contributor : Xunhua Guo <xunhua(dot)guo(at)gmail(dot)com>
# Contributor : Robert Orzanna <orschiro(at)gmail(dot)com>
# Contributor : Cassfalg <ch(dot)assfalg(at)gmx(dot)de>

pkgname=teamdrive
pkgver=4.7.4.3178
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
sha256sums_x86_64=('898f4101ec7c8232c3a60c2a95d94aaa98b0bad0d83dfa6b4d7474dc5b3af4e3')

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

