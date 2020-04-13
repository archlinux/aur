# Maintainer: Rin Cat <me@rin.cat>
pkgname=mtg-git
_pkgbase=mtg
pkgver=0.15.1.r175.gad7acee
pkgrel=1
pkgdesc='Bullshit-free MTProto proxy for Telegram'
arch=('x86_64')
url='https://github.com/9seconds/mtg'
license=('MIT')
depends=('glibc')
makedepends=('go')

source=(
     "git+https://github.com/9seconds/mtg"
     'mtg.service'
     'mtg.sysconfig'
)
sha256sums=(
     'SKIP'
     '49bc96acf5c3d69800315eb9a06510ba71f7cf9024d3fa8f204937f2fad4bbf7'
     '74b77ac1dcf44c52d38f58d339d2317930207fff95dfce75ebfc82a3683d5e75'
)

backup=('etc/conf.d/mtg')

pkgver() {
    cd "${_pkgbase}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgbase}"
    make
}

package() {
    install -Dm755 "${srcdir}/${_pkgbase}/mtg" "${pkgdir}/usr/bin/mtg"
    install -Dm644 "${srcdir}/mtg.service" "${pkgdir}/usr/lib/systemd/system/mtg.service"
    install -Dm644 "${srcdir}/mtg.sysconfig" "${pkgdir}/etc/conf.d/mtg"
}


