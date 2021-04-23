# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protomail.com>

pkgname=keysmith
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="OTP client for Plasma Mobile and Desktop."
arch=("any")
url="https://invent.kde.org/utilities/${pkgname}"
license=("GPL3")
groups=()
depends=()
makedepends=("cmake" "extra-cmake-modules" "frameworkintegration" "kirigami2" "libsodium" "qt5-base" "qt5-quickcontrols2" "sudo")
checkdepends=()
optdepends=()
provides=()
conflicts=("keysmith-git")
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
noextract=()
md5sums=("bb63b3c244d5a6ca5686f0af423866e8")
validpgpkeys=()

build()
{
    mkdir -p ${srcdir}/${pkgname}-v${pkgver}/build/
    cd ${srcdir}/${pkgname}-v${pkgver}/build/
    cmake ..
    make
}

package()
{
    # Assure that the directories exist.
    mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/

    # Install the software.
    cd ${srcdir}/${pkgname}-v${pkgver}/build/
    sudo make install

    # Install the documentation.
    install -Dm644 ${srcdir}/${pkgname}-v${pkgver}/README.md ${pkgdir}/usr/share/doc/${pkgname}/

    # Install the license.
    install -Dm644 ${srcdir}/${pkgname}-v${pkgver}/LICENSES/GPL-3.0-or-later.txt ${pkgdir}/usr/share/licenses/${pkgname}/
}
