# Maintainer: Sick Codes <info at sick dot codes>
# Maintainer: Christian Hoff <https://github.com/choff>
# Contributor: Tobias Martin <tm-x at gmx dot net>

_commit=ee4c25f064d89f08136d5814bf2368512973017f

pkgname=binder_linux-dkms
pkgver=6.14
pkgrel=1
arch=("x86_64")
url='https://github.com/choff/anbox-modules'
pkgdesc='Android kernel driver fork by @choff in DKMS format, binder only.'
license=("GPL3")
conflicts=("anbox-modules-dkms")
depends=("dkms")
source=(
    "anbox-modules-${_commit}.tar.gz::https://github.com/choff/anbox-modules/archive/${_commit}.tar.gz"
    "pr-22.diff::https://github.com/choff/anbox-modules/pull/22.diff"
)
sha256sums=('8c095231f854a4c7ebe45a92386b6d69a2e4de851806a53e1bf314a4f397d1a0'
            'fd53db18744233fdf80c116d21330a4e0acdeff246c02929068ffedd8c3d8ab1')
prepare(){
     cd "${srcdir}/anbox-modules-${_commit}"
     for diff_file in "${srcdir}/"*.diff
     do
         patch -Np1 -i "$diff_file"
     done
}
package(){
    install -dm755 "${pkgdir}/usr/src/binder-1"
    cp -r "${srcdir}/anbox-modules-${_commit}/binder/"* "${pkgdir}/usr/src/binder-1/"
}
