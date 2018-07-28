# Maintainer: Joseph Brains <jnbrains@gmail.com>
_pkgname=ubridge
pkgname=${_pkgname}-git
pkgver=v0.9.14.r11.g634062b
pkgrel=1
pkgdesc='Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces.'
arch=('any')
url="https://github.com/GNS3/${_pkgname}"
license=('GPL3')
groups=('gns3')
depends=('libpcap')
makedepends=('git' 'gcc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+git://github.com/GNS3/${_pkgname}.git")
install="${_pkgname}.install"
sha256sums=('SKIP')

pkgver() {
    cd $srcdir/${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/${_pkgname}
    make
}

package() {
    install -Dm755 ${srcdir}/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
    install -dm755 ${pkgdir}/usr/share/doc/${_pkgname}
    install -m644 ${srcdir}/${_pkgname}/README.rst -t ${pkgdir}/usr/share/doc/${_pkgname}
    install -Dm644 ${srcdir}/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
