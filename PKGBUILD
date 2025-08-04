# Maintainer: Sick Codes <info at sick dot codes>
# Maintainer: Christian Hoff <https://github.com/choff>
# Contributor: Tobias Martin <tm-x at gmx dot net>

_commit=1434f1ebf74135a99d17e83f25d8e23908efc4cf

pkgname=binder_linux-dkms
pkgver=6.16
pkgrel=2
arch=("x86_64")
url='https://github.com/choff/anbox-modules'
pkgdesc='Android kernel driver fork by @choff in DKMS format, binder only.'
license=("GPL3")
conflicts=("anbox-modules-dkms")
depends=("dkms")
source=("anbox-modules-${_commit}.tar.gz::https://github.com/choff/anbox-modules/archive/${_commit}.tar.gz")
sha256sums=('0e75230fc0b34e2e75a3cb3b6a9347105d4f0ba14f4449c8131084ffbb359da5')
prepare(){
    cd "${srcdir}/anbox-modules-${_commit}"
    find "${srcdir}" -mindepth 1 -maxdepth 1 -type l \( -name "*.patch" -o -name "*.diff" \) \
        -printf "Applying %f...\n" \
        -exec patch -Np1 -i {} \;
}
package(){
    install -dm755 "${pkgdir}/usr/src/binder-1"
    cp -r "${srcdir}/anbox-modules-${_commit}/binder/"* "${pkgdir}/usr/src/binder-1/"
}
