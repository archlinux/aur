# Maintainer: Pizero <zhaory200707@outlook.com>
pkgname=class-widgets-bin
_appname=cn.rinlit.classwidgets
pkgver=1.2.0.4
_build_suffix='21334301646'
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

source_x86_64=("${pkgname}::${url}/releases/download/${pkgver}/ClassWidgets-Linux-x64_${_build_suffix}.deb")
sha256sums_x86_64=('51af29db382c7cb2518a5545d92d9d9c3e747b0dce0386c3a9f4211cabea9cce')

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
