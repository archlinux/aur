# Maintainer: RedTide <redtid3@gmail.com>

pkgname=smarthhc
pkgver=0.1.1alpha
pkgrel=1
_pkgname="${pkgname}-app-${pkgver}"
pkgdesc="Digital HiHat Controller"
url="https://github.com/azdrums/smarthhc-app"
arch=('x86_64')
license=('GPL2')
depends=('qt5-base' 'qt5-serialport' 'qt5-connectivity')
optdepends=('bluez: to work with bluetooth device')
source=(
    "https://github.com/azdrums/smarthhc-app/archive/${pkgver}.tar.gz"
    "fix-desktop-file.patch::https://github.com/azdrums/smarthhc-app/commit/f39991b.patch"
)
sha512sums=(
    'f1acb53cae2a13997d04ea697436ad6d1e255c5ec287687f739801c71a40d7f44d6e920f72dcf4fd288e9a1495a9fbde0035b0f66de9168e6c0c4125bf4bcaca'
    '34be70e662a5db33649ab9e2c1f881fb28a64483904ed89967f65d3eba35dcd38aab36a202495f5813c24a20da3d5599c993233b21b61675f6eed515fa61a58e'
)
prepare() {
    cd "${srcdir}/${_pkgname}"
    patch --forward --strip=1 --input="${srcdir}/fix-desktop-file.patch"
}
build() {
    cd "${srcdir}/${_pkgname}"
    qmake PREFIX="/usr/" SmartHHC.pro
    make INSTALL_DIR=$pkgdir
}
package() {
    cd "${srcdir}/${_pkgname}"
    make INSTALL_ROOT=$pkgdir install
}
