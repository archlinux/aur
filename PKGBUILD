# Maintainer: FadeMind <fademind@gmail.com>
_exename=xembedsniproxy
_pkgname=xembed-sni-proxy
pkgname=${_pkgname}-git
pkgver=20150929.96ae68b
pkgrel=1
pkgdesc="Convert XEmbed system tray icons to SNI icons"
arch=('i686' 'x86_64')
url="https://github.com/davidedmundson/${_pkgname}"
license=('GPL2')
depends=(qt5-{base,x11extras} sni-qt kwindowsystem knotifications)
makedepends=('extra-cmake-modules' 'git')
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
    cd ${srcdir}/${_pkgname}
    if [ -d build ] ; then
        rm build -rf
    fi
    mkdir build && cd build
    cmake ..
    make
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/etc/xdg/autostart"
    install -m755 "${srcdir}/${_pkgname}/build/${_exename}"     "${pkgdir}/usr/bin/${_exename}"
    install -m644 "${srcdir}/${_pkgname}/${_exename}.desktop"   "${pkgdir}/etc/xdg/autostart/${_exename}.desktop"
    cd "${pkgdir}/usr/bin/"
    ln -s ./${_exename} "${pkgdir}/usr/bin/davetray"
}
