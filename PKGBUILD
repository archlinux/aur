# Maintainer: Chad "crossroads1112" Sharp <crossroads1112@riseup.net>
pkgname=lumina-desktop
pkgver=1.4.0
pkgrel=1
pkgfullname="${pkgname%-*}-${pkgver}"
pkgdesc="A Lightweight QT5 Desktop for FreeBSD"
arch=('x86_64' 'i686')
url="https://github.com/trueos/lumina"
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'qt5-multimedia' 'qt5-x11extras' 'fluxbox' 'oxygen' 'oxygen-icons' 'xscreensaver' 'desktop-file-utils')
optdepends=('xorg-xbacklight: required for changing screen brightness' 'alsa-utils: required for adjusting audio volume' 'acpi: required for monitoring battery life' 'numlockx: required for changign state of numlock at login' 'pavucontrol: required for detatched audio mixer' 'fluxmod-styles: A good set of Fluxbox themes to improve the appearence of window decorations' 'network-manager-applet: Manage network connections from panel' 'xterm: Terminal emulator')
makedepends=('qt5-base' 'qt5-tools')
conflicts=("lumina-de-git" "lumina-desktop-git" "insight-fm")
provides=("${pkgname%-*}" "insight-fm")
install="${pkgname%-*}.install"
source=("https://github.com/trueos/lumina/archive/v${pkgver}.tar.gz")
sha512sums=('7243fc366a851832d9431df8ae8cac0f70a7bc92bed1282e78e5775c6593d799a07e2cac7042d770c8d6c4758bb142523027d67227a2282b47ed945b0e617cb0')


build(){
    cd "$srcdir/${pkgfullname}"
    find $srcdir/${pkgfullname} -name *.desktop -exec sed -i 's/usr\/local/usr/' {} \;
    qmake-qt5 QMAKE_CFLAGS_ISYSTEM= PREFIX="/usr" QT5LIBDIR=/usr/lib/qt
    make
}

package() {
    cd "$srcdir/${pkgfullname}"
    make INSTALL_ROOT="${pkgdir}" install
    mv "${pkgdir}"/usr/etc "${pkgdir}"/etc
    mv "${pkgdir}"/usr/man "${pkgdir}"/usr/share/man
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
