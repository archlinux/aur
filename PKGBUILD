# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
pkgname=nepdate
pkgdesc='Standalone Nepali calendar widget and converter for Bikram Sambat and Gregorian calendars.'
pkgver=1.0
pkgrel=1
_commithash=524477dbe6fb92f836a63d00ff7006e6c6a74072
arch=(x86_64)
url="https://github.com/khumnath/nepdate"
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt6-base' 'qt6-declarative')
makedepends=('cmake' 'qt6-shadertools' 'qt6-tools')
license=('GPL-3.0-or-later')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/524477dbe6fb92f836a63d00ff7006e6c6a74072.tar.gz")
sha256sums=('547a1a9db0ee62ea03d3ace2bdb5ab28c30bc65dcc616739434a58dd2f84e913')

prepare() {
    cd "${pkgname}-${_commithash}"
    mkdir build
}

build() {
    cd "${pkgname}-${_commithash}/build"
    cmake ..
    make all
}

package() {
    #install binary
    install -Dm755 "${srcdir}/${pkgname}-${_commithash}/build/bikram-calendar" "${pkgdir}/usr/bin/bikram-calendar"
    #make .desktop file
    install -d "${pkgdir}/usr/share/applications"
    echo "[Desktop Entry]
[Desktop Entry]
Categories=Utility;Calendar;
Comment=Nepali Calendar Application
Icon=calendar
Exec=/usr/bin/bikram-calendar
Name=Nepdate Calendar
StartupNotify=true
StartupWMClass=NepaliCalendar
Terminal=false
Type=Application
NoDisplay=true" > "${pkgdir}/usr/share/applications/nepdate.desktop"
}
