# Maintainer: Sick Codes <info at sick dot codes>
# Maintainer: Christian Hoff <https://github.com/choff>
# Contributor: Tobias Martin <tm-x at gmx dot net>

_commit=7e31e5d818386c7c8fe9b43916dc5e1844ac7b9a

pkgname=binder_linux-dkms
pkgver=6.16
pkgrel=1
arch=("x86_64")
url='https://github.com/choff/anbox-modules'
pkgdesc='Android kernel driver fork by @choff in DKMS format, binder only.'
license=("GPL3")
conflicts=("anbox-modules-dkms")
depends=("dkms")
source=("anbox-modules-${_commit}.tar.gz::https://github.com/choff/anbox-modules/archive/${_commit}.tar.gz"
        "fix-build-on-6.16.diff::https://github.com/choff/anbox-modules/pull/24.diff")
sha256sums=('9e9700eb69b27a2c0f271cf23fb09033dc959ab983f3bd4cc5e373d23c39e9a5'
            '4a08c3d6eeb65abf3fdb6f79f8fdbd90ab308979d5942cbd18859a41073d43e5')
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
