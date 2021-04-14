# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=maxx-desktop
pkgver=2.1.1
pkgrel=1
pkgdesc='MaXX Interactive Desktop'
url="https://docs.maxxinteractive.com/"
depends=('libjpeg6' 'ncurses5-compat-libs')
arch=('x86_64')
license=('custom')
noextract=("MaXX-Desktop-v${pkgver}-LINUX-x64-tar.xz")
source=("https://s3.ca-central-1.amazonaws.com/cdn.maxxinteractive.com/maxx-desktop-installer/${noextract[0]}")
sha256sums=('3214e75cfde9c5408b57437c33b88469c0df387ab4f9b6bd99236c85ef02a9f9')
install=$pkgname.install
options=('!strip')

package() {
    install -d "${pkgdir}"/opt
    tar Jxf ${noextract[0]} -C "${pkgdir}"/opt/
    install -d "${pkgdir}"/usr/share/xsessions
    ln -s /opt/MaXX/share/xsessions/maxx.desktop "${pkgdir}"/usr/share/xsessions/maxx.desktop
    install -d "${pkgdir}"/usr/share/icons

    for i in "${pkgdir}"/opt/MaXX/share/icons/*; do
        t=$(basename $i)
        ln -s "/opt/MaXX/share/icons/$t" "${pkgdir}/usr/share/icons/$t"
    done
}
