# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protomail.com>

pkgname=keysmith
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="OTP client for Plasma Mobile and Desktop."
arch=("any")
url="https://github.com/KDE/${pkgname}"
license=("GPL3")
groups=()
depends=("frameworkintegration" "libsodium" "qt5-base")
makedepends=("cmake")
checkdepends=()
optdepends=()
provides=()
conflicts=("keysmith-git")
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KDE/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
md5sums=("07ac50d5681fba2a771a459e88eadc6b")
validpgpkeys=()

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}/
    mkdir -p ${srcdir}/${pkgname}-${pkgver}/build/
    cd ${srcdir}/${pkgname}-${pkgver}/build/
    cmake ..
    make
}

package()
{
    # Assure that the folders exist.
    mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/

    # Install the software.
    cd ${srcdir}/${pkgname}-${pkgver}/build/
    make install

    # Install the documentation.
    install -Dm644 ${srcdir}/${pkgname}-${pkgver}/README.md ${pkgdir}/usr/share/doc/${pkgname}/

    # Install the license.
    install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSES/ ${pkgdir}/usr/share/licenses/${pkgname}/
}
