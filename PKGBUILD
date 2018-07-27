# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=anydesk-test
pkgver=2.9.8
pkgrel=1
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support - Playground-Version"
arch=('i686' 'x86_64')
url="https://anydesk.de"
license=('custom:Freeware')
depends=('fakeroot' 'gtkglext' 'libglvnd' 'gtk2' 'libx11' 'glibc' 'glib2' 'gdk-pixbuf2' 'libxcb' 'cairo' 'pango' 'libxi' 'libxrandr' 'libxtst' 'libxext' 'libxfixes' 'libxdamage' 'gcc-libs')
optdepends=('libpulse')
conflicts=('anydesk')

source_i686=("http://download.anydesk.com/linux/anydesk_${pkgver}-1_i386.deb" "https://download.anydesk.com/linux/anydesk-${pkgver}-i686.tar.gz")
source_x86_64=("http://download.anydesk.com/linux/anydesk_${pkgver}-1_amd64.deb" "https://download.anydesk.com/linux/anydesk-${pkgver}-amd64.tar.gz")

sha256sums_i686=('09b1f74a5cdf283eda25031ae2894d1e8c9167be83230caef686acd171ab4647' 'f278ba67c9ebced8d8635b9cea6c67313c76985b8208d9e7403c1fe1f82803bc')
sha256sums_x86_64=('5c0331a7de196e88db9f5bd2d36f67f65c76cddb67ccaaa884f2d6c5d17d4e10' 'f60e5144d1a85d81f3c7a5d33595bf076f30faf636b2a1e7c5d616081e2cfee7')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.gz"
    install -m755 "${srcdir}/anydesk-${pkgver}/anydesk" "${pkgdir}/usr/bin/anydesk"
    #
    msg2 "\e[1;32mAnyDesk now has a systemd file for unattendant access: anydesk.service \e[0m"
    install -D -m 644 "${pkgdir}/usr/share/anydesk/files/systemd/anydesk.service" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
    sed -i "s/PIDFile=\/tm\/ad.pid/PIDFile=\/run\/anydesk.pid/" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
}
