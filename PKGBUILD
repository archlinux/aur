# Maintainer: BBaoVanC <bbaovanc@bbaovanc.com>
pkgname=checkra1n-gui
pkgver=0.12.2
pkgrel=1
pkgdesc="checkra1n is a semi-tethered jailbreak based on the checkm8 bootrom exploit. (GUI version)"
license=('unknown')
url="https://checkra.in"
conflicts=('checkra1n')
arch=('x86_64')
depends=(libimobiledevice libirecovery libtvcontrol ncurses5-compat-libs gtk3)
makedepends=(binutils tar)
provides=(checkra1n)
_debname="checkra1n_${pkgver}_amd64.deb"
source=("https://assets.checkra.in/debian/${_debname}")
sha256sums=('e9e7ad0e9a54514590e04664252f14d3ab0653d5a4d93c86f55927db20d28020')

options=(!strip) # for some reason, checkra1n segfaults if the binary is stripped

package() {
    ar x ${_debname}
    tar -xvf data.tar.xz
    echo "exec checkra1n --gui" > checkra1n-gui # wrapper script
    mkdir -p ${pkgdir}/usr/bin
    install -m 0755 usr/bin/checkra1n ${pkgdir}/usr/bin/checkra1n
    install -m 0755 checkra1n-gui ${pkgdir}/usr/bin/checkra1n-gui
}
