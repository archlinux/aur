# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=maxx-desktop
pkgver=2.2.0
pkgrel=1
pkgdesc='MaXX Interactive Desktop'
url="https://docs.maxxinteractive.com/"
depends=('libjpeg6-turbo' 'ncurses5-compat-libs' 'ttf-dejavu' 'noto-fonts' 'noto-fonts-extra')
arch=('x86_64')
license=('LicenseRef-MaXX-license')
noextract=("MaXX-Desktop-v${pkgver}-LINUX-x86_64-tar.gz")
source=("https://s3.ca-central-1.amazonaws.com/cdn.maxxinteractive.com/maxx-desktop-installer/${noextract[0]}")
sha256sums=('58975238ceeaffd16b85bff569f3ca9a1227babb5b3b584c2b5e3ec1d1cbb156')
install=$pkgname.install
options=('!strip' '!debug')

package() {
    install -d "${pkgdir}"/opt
    tar zxf ${noextract[0]} -C "${pkgdir}"/opt/
    install -d "${pkgdir}"/usr/share/xsessions
    ln -s /opt/MaXX/share/xsessions/maxx.desktop "${pkgdir}"/usr/share/xsessions/maxx.desktop
    install -d "${pkgdir}"/usr/share/icons

    cd "${pkgdir}"/opt/MaXX/share/icons

    for i in Irix Xcursor-Pro-Red redSGI sgi; do
        ln -s "/opt/MaXX/share/icons/${i}" "${pkgdir}/usr/share/icons/${i}"
    done

    install -d "${pkgdir}"/usr/share/icons/hicolor/48x48/apps
    ln -s "/opt/MaXX/share/icons/hicolor/48x48/apps/feh.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/feh.png"
    install -d "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
    ln -s "/opt/MaXX/share/icons/hicolor/scalable/apps/feh.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/feh.svg"

    install -d "${pkgdir}"/usr/share/licenses/$pkgname
    ln -s "/opt/MaXX/doc/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
