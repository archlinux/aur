# Maintainer: Sick Codes <info at sick dot codes>
# Maintainer: Christian Hoff <https://github.com/choff>
# Contributor: Tobias Martin <tm-x at gmx dot net>

_commit=4d68f90e11992601e8072bcbf6dcd6ca603364a9

pkgname=binder_linux-dkms
pkgver=7.1
pkgrel=4
arch=("any")
url='https://github.com/choff/anbox-modules'
pkgdesc='Android kernel driver fork by @choff in DKMS format, binder only.'
license=("GPL-2.0-only")
provides=(BINDER-MODULE)
conflicts=("anbox-modules-dkms")
source=("anbox-modules-${_commit}.tar.gz::https://github.com/choff/anbox-modules/archive/${_commit}.tar.gz")
sha256sums=('6db980fbd959563908eab55f033e3376d8b1820b365469442a249bf4029688c2')
prepare(){
    cd "${srcdir}/anbox-modules-${_commit}"
    find "${srcdir}" -mindepth 1 -maxdepth 1 -type l \( -name "*.patch" -o -name "*.diff" \) \
        -printf "Applying %f...\n" \
        -exec patch -Np1 -i {} \;
}
package(){
    depends=('dkms')
    install -Dm644 -t "${pkgdir}/usr/src/binder-1" \
        "${srcdir}/anbox-modules-${_commit}/binder/"*.{c,h} \
        "${srcdir}/anbox-modules-${_commit}/binder/dkms.conf" \
        "${srcdir}/anbox-modules-${_commit}/binder/Makefile"
}
