# Maintainer: Michael Asher <michael@wesolveeverything.com>

pkgname=electerm-bin
pkgver=1.38.11
pkgrel=1
pkgdesc="An electron-based SSH/SFTP Connection manager and terminal"
arch=('x86_64')
url="https://electerm.html5beta.com"
license=('MIT')
_pkgname="electerm"
provides=("electerm")
conflicts=("electerm" "electerm-git")
source=(
        "https://github.com/electerm/electerm/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
        "https://raw.githubusercontent.com/electerm/electerm/master/LICENSE"
)

prepare() {
        ar -x ${_pkgname}-${pkgver}-linux-amd64.deb
        cd ${srcdir}
        tar -xf ./data.tar.xz  
        # Cleanup non-X64 items
        cd opt/electerm/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/
        rm -rf *arm* 
        rm -rf *win*
}

package() {
        cp -r ${srcdir}/opt ${pkgdir}/
        cp -r ${srcdir}/usr ${pkgdir}/
        install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

sha256sums=('dfe4742798e193ce868c24f02279a34a5a96ebfc824242ff4d2d0097a27383fd'
            'a9b7ccf11bec7796b217a7575d3324c16613a46bfc899e72ec2c11da28d0991e')

