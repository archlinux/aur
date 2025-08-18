# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
pkgname=nepdate
pkgdesc='Standalone Nepali calendar widget and converter for Bikram Sambat and Gregorian calendars.'
pkgver=2.2.3
pkgrel=1
# _commithash=524477dbe6fb92f836a63d00ff7006e6c6a74072
arch=(x86_64)
url="https://github.com/khumnath/nepdate"
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt6-base' 'qt6-declarative')
makedepends=('cmake' 'qt6-shadertools' 'qt6-tools')
license=('GPL-3.0-or-later')
# source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/524477dbe6fb92f836a63d00ff7006e6c6a74072.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('08e140a5dfb856029ec85837ec47b1f2c04c0442cf2adda5aa31f06ba6a33861')

prepare() {
#     cd "${pkgname}-${_commithash}"
    cd "${pkgname}-${pkgver}"
    mkdir build
}

build() {
#     cd "${pkgname}-${_commithash}/build"
    cd "${pkgname}-${pkgver}/build"
    cmake ..
    make all
}

package() {
    #install binary
#     install -Dm755 "${srcdir}/${pkgname}-${_commithash}/build/bikram-calendar" "${pkgdir}/usr/bin/bikram-calendar"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/build/bikram-calendar" "${pkgdir}/usr/bin/bikram-calendar"
    #make .desktop file
    install -d "${pkgdir}/usr/share/applications"
    echo "[Desktop Entry]
Categories=Utility;Calendar;
Comment=Nepali Calendar Application
Icon=calendar
Exec=/usr/bin/bikram-calendar
Name=Nepdate Calendar
StartupNotify=true
StartupWMClass=NepaliCalendar
Terminal=false
Type=Application" > "${pkgdir}/usr/share/applications/nepdate.desktop"
}
