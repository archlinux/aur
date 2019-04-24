pkgname=anydesk-5
pkgver=5.0.0
pkgrel=1
pkgdesc="Anydesk is an remote Control and view Software"
arch=('i686' 'x86_64')
url="https://anydesk.de"
license=('custom:Freeware')
depends=('fakeroot' 'python-shiboken2' 'gtkglext' 'libglvnd' 'gtk2' 'libx11' 'glibc' 'glib2' 'gdk-pixbuf2' 'libxcb' 'cairo' 'pango' 'libxi' 'libxrandr' 'libxtst' 'libxext' 'libxfixes' 'libxdamage' 'gcc-libs')
optdepends=('libpulse')
conflicts=('anydesk-test' 'anydesk')

source_i686=(https://download.anydesk.com/linux/anydesk_5.0.0-1_i386.deb)
source_x86_64=(https://download.anydesk.com/linux/anydesk_5.0.0-1_amd64.deb)

sha256sums_i686=('bb680cf99fc9a5e88721b833d34c0aed82b5cb5953685c0e8ddcf8b2398128eb')
sha256sums_x86_64=('4339c58c228ce7518f72dd3ab3a0cebf8ac012061a11633d8caacda461f06499')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.gz"
    #
    msg2 "\e[1;32mAnyDesk now has a systemd file for unattendant access: anydesk.service \e[0m"
    install -D -m 644 "${pkgdir}/usr/share/anydesk/files/systemd/anydesk.service" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
    sed -i "s/PIDFile=\/tm\/ad.pid/PIDFile=\/run\/anydesk.pid/" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
}
