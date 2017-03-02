# Maintainer: lithm <lithm at posteo dot de>
pkgname=cute3dscapture-git
_binname=Cute3DSCapture
pkgver=1.3.r18.g33c9a78
pkgrel=1
pkgdesc="A 3DS capture software"
arch=('i686' 'x86_64')
url="https://github.com/Gotos/Cute3DSCapture"
license=('unknown')
depends=('sfml' 'libusb')
makedepends=('git')
provides=('cute3dscapture')
conflicts=('cute3dscapture')
backup=('etc/udev/rules.d/95-3dscapture.rules')
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/Gotos/Cute3DSCapture.git")
md5sums=('SKIP')


pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    ./autogen.sh
    ./configure
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    install -D -m755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
    install -D -m644 "95-3dscapture.rules" "${pkgdir}/etc/udev/rules.d/95-3dscapture.rules"
}
