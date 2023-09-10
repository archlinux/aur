# Maintainer:  Alexei Colin <ac at alexeicolin dot com>

pkgname=ti-cgt-arm
pkgver=20.2.7.LTS
pkgrel=2
pkgdesc="Texas Instruments Code Generation Tools (compiler) for ARM"
arch=('x86_64')
url="http://www.ti.com/tool/ARM-CGT"
license=('custom')

#optdepends=('ccstudio')
conflicts=('ccstudio') # current package ships with the toolchains

_installer="ti_cgt_tms470_${pkgver}_linux-x64_installer.bin"
source=("https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-sDOoXkUcde/${pkgver}/${_installer}")

options=(!strip libtool staticlibs emptydirs !purge !zipman)

_ccsdir=opt/ccstudio
_installdir=ccs/tools/compiler

prepare() {
    cd $srcdir
    chmod +x ./${_installer}
}

package() {
    echo ">>> Running installer..."

    ./${_installer} --mode unattended --prefix $pkgdir/${_ccsdir}/${_installdir}

    # Match permissions to ccstudio package (see notes in ccstudio.install)
    find $pkgdir/${_ccsdir} -type d -exec chmod 0775 {} \;

    install -D -m0644 $pkgdir/${_ccsdir}/${_installdir}/${pkgname}_${pkgver}/ARM_RTS_${pkgver}_manifest.html $pkgdir/usr/share/licenses/$pkgname/LICENSE.html
}

sha256sums=('697bc381ed00c52d7be19d67f1cdf651a3068ec7c38404edd696ee7f801fb3e8')
