# Maintainer: Rin Cat <me@rin.cat>
pkgname=mtg-git
_pkgbase=mtg
pkgver=0.15.1.r27.gc2b8e88
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
     '02a0aa1205374d417e6b148a73476ced0f77bfb0918e6138eb48982676bc2940'
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


