# Maintainer: RedTide <redtid3@gmail.com>

pkgname=smarthhc
pkgver=0.1.1alpha
pkgrel=2
_pkgname="${pkgname}-${pkgver}"
pkgdesc="Digital HiHat Controller"
url="https://github.com/azdrums/${pkgname}"
arch=('x86_64')
license=('GPL2')
depends=('qt5-base' 'qt5-serialport' 'qt5-connectivity')
optdepends=('bluez: to work with bluetooth device')
source=(
    "https://github.com/azdrums/${pkgname}/archive/${pkgver}.tar.gz"
    "fix-desktop-file.patch::https://github.com/azdrums/${pkgname}/commit/f39991b.patch"
)
sha512sums=(
    '0753eb6276fd5af1921a61ae9cbec6e73aac7f3018230d227c61187a9cff5321f7a63b2fb7a99a16d66cfb3f6728573a9241106431c9ad6d4f44db07e6868713'
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
