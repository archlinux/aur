# Maintainer : jaltek <jaltek(at)mailbox(dot)org>
# Maintainer : Matthieu Froment <thieume(at)mailoo(dot)org>
# Contributor : Xunhua Guo <xunhua(dot)guo(at)gmail(dot)com>
# Contributor : Robert Orzanna <orschiro(at)gmail(dot)com>
# Contributor : Cassfalg <ch(dot)assfalg(at)gmx(dot)de>

pkgname=teamdrive
pkgver=4.7.1.3011
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


sha256sums=('8cd967dbe70c0ca845c3a3075cac9ad2f7342d63a5e32d81eaa9c2bc20a59699')
sha256sums_x86_64=('17bbc53e6ee0a54ffeeb3f7fd234d6c89f4908e06eaa2191832674bd8c394c29')

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

