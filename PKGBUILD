# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
pkgname=nepdate
pkgdesc='Standalone Nepali calendar widget and converter for Bikram Sambat and Gregorian calendars.'
pkgver=1.0
pkgrel=1
arch=(x86_64)
url="https://github.com/khumnath/nepdate"
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt6-base' 'qt6-declarative')
makedepends=('cmake' 'qt6-shadertools' 'qt6-tools')
license=('GPL-3.0-or-later')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fd551e74e1572470d154e681d00a302d48b490a5310b8e03f467c07703c92f84')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir build
}

build() {
    cd "${pkgname}-${pkgver}/build"
    cmake ..
    make all
}

package() {
    #install binary
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/build/nepdate" "${pkgdir}/usr/bin/nepdate"
    #make .desktop file
    install -d "${pkgdir}/usr/share/applications"
    echo "[Desktop Entry]
[Desktop Entry]
Categories=Utility;Calendar;
Comment=Nepali Calendar Application
Icon=calendar
Exec=/usr/bin/nepdate
Name=Nepdate Calendar
StartupNotify=true
StartupWMClass=NepaliCalendar
Terminal=false
Type=Application
NoDisplay=true" > "${pkgdir}/usr/share/applications/nepdate.desktop"
}
