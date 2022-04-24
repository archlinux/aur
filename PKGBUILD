# Maintainer: Radeox <dawid.weglarz95@gmail.com>

pkgname=geforcenow-electron
_newpkgname=gfn-electron
pkgver=1.5.0
pkgrel=1
pkgdesc="Linux desktop client for GeForce NOW, using Electron"
arch=("armv7l" "i686" "x86_64")
url="https://github.com/hmlendea/${_newpkgname}"
license=('GPLv3')
depends=('libva')
source=("https://github.com/hmlendea/${_newpkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/hmlendea/${pkgname}/master/icon.png")
sha256sums=("1a62e3fbf2f0a4bace1579f573aed8a286cccae42674ab8cee44580be7a9e5d5"
            "582ad4bb073926e51d8acaa0ab81aa70a1dbe4736eda0cf130b6ae689982b7a0")

build() {
    cd ${srcdir}/${_newpkgname}-${pkgver}/
    npm install
}

package() {
    install -d ${srcdir} ${pkgdir}/opt/${pkgname}
    install -d ${pkgdir}/usr/share/applications
    install -d ${pkgdir}/usr/share/pixmaps
    install -d ${pkgdir}/usr/bin/

    cp -r ${srcdir}/${_newpkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}/
    echo "cd /opt/${pkgname} && npm start" > ${pkgdir}/opt/${pkgname}/${pkgname}
    chmod +x ${pkgdir}/opt/${pkgname}/${pkgname}
    ln -s /opt/${pkgname}/geforcenow-electron ${pkgdir}/usr/bin/geforcenow

    install -m644 ${srcdir}/${_newpkgname}-${pkgver}/icon.png ${pkgdir}/usr/share/pixmaps/nvidia.png
    install -m755 ${srcdir}/${_newpkgname}-${pkgver}/com.github.hmlendea.geforcenow-electron.desktop ${pkgdir}/usr/share/applications
}
