# Maintainer:Chenx Dust <chenx_dust@outlook.com>
pkgname=ez4connect
pkgver=1.2.9
pkgrel=1
pkgdesc="Imporved Qt-based ZJU-Connect GUI"
arch=("i686" "x86_64" "armv7h" "aarch64" "riscv64")
url='https://github.com/PageChen04/EZ4Connect'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt6-base>6.8.0' 'qt6-5compat>=6.8.0' 'zju-connect-bin')
makedepends=('make' 'qt6-tools' 'gcc' 'cmake')
provides=('ez4connect')
conflicts=('ez4connect')
_appname='EZ4Connect'

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('0ec8afa728bc88c31f06e100af0efbd26261a32e71dfb36e460171e794d54a5a')

build(){
    cd "${srcdir}"/${_appname}-${pkgver}
    mkdir -p build
    cmake -DNIGHTLY_BUILD=OFF -DREL_VER=${pkgver} -S . -B build
    cmake --build build --target ${_appname}
}
package() {
    cd "${srcdir}"/${_appname}-${pkgver}
    install -Dm755 "build/${_appname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "resource/icon.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.png"
    
    cat <<EOF > "${_appname}.desktop"
[Desktop Entry]
Name=${_appname}
Exec=${pkgname}
Icon=${_appname}
Type=Application
Categories=Network;Security;
EOF
    install -Dm644 "${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
}
