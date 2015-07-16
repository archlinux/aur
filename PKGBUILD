# Maintainer: Chad "crossroads1112" Sharp <crossroads1112@riseup.net>
pkgname=lumina-desktop
pkgver=0.8.5
pkgrel=1
my_pkgrel=Release
pkgfullname="${pkgname%-*}-${pkgver}-${my_pkgrel}"
pkgdesc="A Lightweight QT5 Desktop for FreeBSD"
arch=('x86_64' 'i686')
url="https://github.com/pcbsd/lumina"
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'qt5-multimedia' 'qt5-x11extras' 'fluxbox' 'oxygen' 'oxygen-icons' 'xscreensaver' 'desktop-file-utils' 'qtchooser')
optdepends=('xorg-xbacklight: required for changing screen brightness' 'alsa-utils: required for adjusting audio volume' 'acpi: required for monitoring battery life' 'numlockx: required for changign state of numlock at login' 'pavucontrol: required for detatched audio mixer' 'fluxmod-styles: A good set of Fluxbox themes to improve the appearence of window decorations' 'network-manager-applet: Manage network connections from panel' 'xterm: Terminal emulator')
makedepends=('qt5-base' 'qt5-tools')
conflicts=("lumina-de-git" "lumina-desktop-git" "insight-fm")
provides=("${pkgname%-*}" "insight-fm")
install="${pkgname%-*}.install"
source=("https://github.com/pcbsd/lumina/archive/v${pkgver}-${my_pkgrel}.tar.gz")
md5sums=('33a39510a1964baf12b32c14a6d80b41')


build(){
    cd $srcdir/${pkgfullname}
    $srcdir/${pkgfullname}/libLumina/make-linux-distro.sh Debian
    find $srcdir/${pkgfullname} -name *.desktop -exec sed -i 's/usr\/local/usr/' {} \;
    qmake-qt5 PREFIX="/usr" QT5LIBDIR=/usr/lib/qt
    make
}

package() {
    cd $srcdir/"${pkgfullname}"
    make INSTALL_ROOT="${pkgdir}" install
    mv "${pkgdir}"/usr/etc "${pkgdir}"/etc
}
