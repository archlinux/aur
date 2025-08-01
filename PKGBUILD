# Maintainer: Sick Codes <info at sick dot codes>
# Maintainer: Christian Hoff <https://github.com/choff>
# Contributor: Tobias Martin <tm-x at gmx dot net>

_commit=7e31e5d818386c7c8fe9b43916dc5e1844ac7b9a

pkgname=binder_linux-dkms
pkgver=6.14
pkgrel=2
arch=("x86_64")
url='https://github.com/choff/anbox-modules'
pkgdesc='Android kernel driver fork by @choff in DKMS format, binder only.'
license=("GPL3")
conflicts=("anbox-modules-dkms")
depends=("dkms")
source=("anbox-modules-${_commit}.tar.gz::https://github.com/choff/anbox-modules/archive/${_commit}.tar.gz")
sha256sums=('9e9700eb69b27a2c0f271cf23fb09033dc959ab983f3bd4cc5e373d23c39e9a5')
prepare(){
     cd "${srcdir}/anbox-modules-${_commit}"
     if [[ -f "${srcdir}/"*.diff ]]
     then
         local diff_file
         for diff_file in "${srcdir}/"*.diff
         do
             patch -Np1 -i "$diff_file"
         done
     fi
}
package(){
    install -dm755 "${pkgdir}/usr/src/binder-1"
    cp -r "${srcdir}/anbox-modules-${_commit}/binder/"* "${pkgdir}/usr/src/binder-1/"
}
