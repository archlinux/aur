# Maintainer: Rin Cat <me@rin.cat>
pkgname=mtg-git
_pkgbase=mtg
pkgver=0.15.1.r19.g78dea9a
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
     'da2722bfcf0d15d8acc308fcd9b2e5cd65420eb92d11a6a8d33f6aefd1e07da6'     
     '3643a656b7c35b87deba5dc6eaf5ac53c11d0f0ae5861f15ec3d3798ebbe61e6'
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


