# Maintainer: Sick Codes <info at sick dot codes>
# Maintainer: Christian Hoff <https://github.com/choff>
# Contributor: Tobias Martin <tm-x at gmx dot net>

_commit=a6aa97d65ba990a470bd015aba682b9f7763129e

pkgname=binder_linux-dkms
pkgver=6.19
pkgrel=2
arch=("x86_64")
url='https://github.com/choff/anbox-modules'
pkgdesc='Android kernel driver fork by @choff in DKMS format, binder only.'
license=("GPL3")
conflicts=("anbox-modules-dkms")
depends=("dkms")
source=("anbox-modules-${_commit}.tar.gz::https://github.com/choff/anbox-modules/archive/${_commit}.tar.gz")
sha256sums=('a1b4bc2cb3ff2f997362a914c38ac44f2b0f62890ffe0d8e42880bc9803214c5')
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
