# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=anydesk-test
pkgver=2.9.7
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

sha256sums_i686=('a2d0e3d781fd5392c158181513f46dc51ad88394d8ab93c475f85bffa2d399fa' 'f4c7b2bcc4932594cfd8b656a2e3f7a63dab1423bab54b16b06903f2910618f6')
sha256sums_x86_64=('edc4fc763ae14a0e103bfa6df89e999aaa246c908b80fe12ecbbe9f9bfe0c890' '8eeed35500b168fa5d0e0a04523466f9874c47bdb491fdededb651783fe7afa8')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.gz"
    install -m755 "${srcdir}/anydesk-${pkgver}/anydesk" "${pkgdir}/usr/bin/anydesk"
    #
    msg2 "\e[1;32mAnyDesk now has a systemd file for unattendant access: anydesk.service \e[0m"
    install -D -m 644 "${pkgdir}/usr/share/anydesk/files/systemd/anydesk.service" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
    sed -i "s/PIDFile=\/tm\/ad.pid/PIDFile=\/run\/anydesk.pid/" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
}
