# Maintainer: Sick Codes <info at sick dot codes>
# Maintainer: Christian Hoff <https://github.com/choff>
# Contributor: Tobias Martin <tm-x at gmx dot net>

_commit=3f65f66a87b2323e56bd0d68993524d034d8b720

pkgname=binder_linux-dkms
pkgver=7.1
pkgrel=2
arch=("any")
url='https://github.com/choff/anbox-modules'
pkgdesc='Android kernel driver fork by @choff in DKMS format, binder only.'
license=("GPL-2.0-only")
provides=(BINDER-MODULE)
conflicts=("anbox-modules-dkms")
source=("anbox-modules-${_commit}.tar.gz::https://github.com/choff/anbox-modules/archive/${_commit}.tar.gz"
        "anbox-modules-pr-29.diff::https://github.com/choff/anbox-modules/pull/29.diff")
sha256sums=('2701c1fbb5812a1a74481f71c60b733754a43a344e37440d82e0f2b782320599'
            '4e19e7098e10ef40cd716c3d6a7f5d6a0c0f6d1651084f6a8b18824ce99043d1')
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
