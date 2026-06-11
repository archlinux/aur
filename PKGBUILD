# Maintainer: Michael Asher <michael@wesolveeverything.com>

pkgname=electerm-bin
pkgver=3.15.50
pkgrel=1
pkgdesc="An electron-based SSH/SFTP Connection manager and terminal"
arch=('x86_64')
url="https://electerm.html5beta.com"
license=('MIT')
_pkgname="electerm"
provides=("electerm")
conflicts=("electerm" "electerm-git"i "electerm-live-bin")
source=(
        "https://github.com/electerm/electerm/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
        "https://raw.githubusercontent.com/electerm/electerm/master/LICENSE"
)

prepare() {
        ar -x ${_pkgname}-${pkgver}-linux-amd64.deb
        cd ${srcdir}
        tar -xf ./data.tar.xz  

        ## Remove ARM related files on amd64
        [ $CARCH == "x86_64" ] && find . -name "*arm*" -print0 | xargs -0 rm  -rf
}

package() {
        cp -r ${srcdir}/opt ${pkgdir}/
        cp -r ${srcdir}/usr ${pkgdir}/
        install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

sha256sums=('1c146d21718ccdca4eca1af6e12579ba866119154862ce78de3e397c8f82e032'
            'a9b7ccf11bec7796b217a7575d3324c16613a46bfc899e72ec2c11da28d0991e')

