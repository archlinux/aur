# Maintainer:Chenx Dust <chenx_dust@outlook.com>
pkgname=ez4connect
pkgver=1.9.1
pkgrel=1
_releasever=1.9.1
pkgdesc="Imporved Qt-based ZJU-Connect GUI"
arch=("i686" "x86_64" "armv7h" "aarch64" "riscv64")
url='https://github.com/chenx-dust/EZ4Connect'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt6-base>6.8.0' 'qt6-5compat>=6.8.0' 'qt6-webengine>=6.8.0' 'zju-connect-bin')
makedepends=('make' 'qt6-tools' 'gcc' 'cmake')
provides=('ez4connect')
conflicts=('ez4connect')
_appname='EZ4Connect'

source=("${pkgname}-${_releasever}.tar.gz::${url}/archive/refs/tags/v${_releasever}.tar.gz")

sha256sums=('c41ab61dd13049a1b80c843c11bb7abf332db295da82e6d9093759ea8397d78e')

build(){
    cd "${srcdir}"/${_appname}-${_releasever}
    mkdir -p build
    cmake -DNIGHTLY_BUILD=OFF -DREL_VER=${_releasever} -S . -B build
    cmake --build build --target ${_appname}
}
package() {
    cd "${srcdir}"/${_appname}-${_releasever}
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
