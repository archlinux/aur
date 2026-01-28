# Maintainer: Pizero <zhaory200707@outlook.com>
pkgname=class-widgets-bin
_appname=cn.rinlit.classwidgets
pkgver=1.2.0.5
_build_suffix='21400908131'
pkgrel=1
pkgdesc="Class Widgets 1"
arch=('x86_64')
url='https://github.com/Class-Widgets/Class-Widgets'
licence=('GPL-3.0-only')
depends=(
    'fontconfig'
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'zlib'
    'xdg-utils'
)
options=('!debug')

source_x86_64=("${pkgname}::${url}/releases/download/${pkgver}/ClassWidgets-Linux-x64.deb")
sha256sums_x86_64=('39130c35ac8dd3a08fe003cdf708bf6636a295b740d80eaa5450dd419c57f62e')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    cd "${pkgdir}"
    mv "./opt/apps/${_appname}/files" "./opt/${pkgname}"

    mkdir -p ./usr/share/icons/hicolor/128x128/apps/
    mv "./opt/apps/${_appname}/entries/icons/hicolor/128x128/apps/favicon.png" "./usr/share/icons/hicolor/128x128/apps/${pkgname}.png"

    rm -r ./opt/apps

    sed -i "s/^Icon=.*/Icon=${pkgname}/" ./usr/share/applications/cn.rinlit.classwidgets.desktop
    sed -i "s/^Exec=.*/Exec=env CLASSWIDGETS_NOT_PORTABLE=1 \/opt\/${pkgname}\/ClassWidgets/" ./usr/share/applications/cn.rinlit.classwidgets.desktop
}
