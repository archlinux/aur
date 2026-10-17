# Maintainer: AngelSherry
pkgname=calibrate-joystick-gui
pkgver=0.6.1
pkgrel=1
pkgdesc="A graphical program to quickly calibrate range and deadzones of joysticks"
arch=('x86_64')
url="https://github.com/dkosmari/calibrate-joystick/"
license=('GPL-3.0-or-later' 'MIT')
depends=('atkmm' 'cairomm' 'dconf' 'glib2' 'glibc' 'glibmm' 'gtk3'
         'gtkmm3' 'libevdev' 'libgcc' 'libgudev' 'libsigc++' 'libstdc++')
options=('!debug' '!emptydirs')
_srcname=calibrate-joystick
source=("https://github.com/dkosmari/${_srcname}/releases/download/v${pkgver}/${_srcname}-${pkgver}.tar.gz")
sha256sums=('0d163a4d680f955bca0e9629da771110d67cb4ffc3a032cf1a07e8fcf5159d6e')

build() {
    cd "${_srcname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --disable-system-libevdevxx \
        --disable-system-libgudevxx
    make
}

package() {
    cd "${_srcname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 external/libevdevxx/COPYING \
        "${pkgdir}/usr/share/licenses/${pkgname}/libevdevxx-MIT"
}
