# Maintainer: lithm <lithm at posteo dot de>
pkgname=cutedscapture-git
_binname=CuteDSCapture
pkgver=1.0.r12.g4e7d453
pkgrel=1
pkgdesc="A DS capture software"
arch=('i686' 'x86_64')
url="https://github.com/Gotos/CuteDSCapture"
license=('unknown')
depends=('sfml' 'libusb')
makedepends=('git')
provides=('cutedscapture')
conflicts=('cutedscapture')
backup=('etc/udev/rules.d/95-dscapture.rules')
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/Gotos/CuteDSCapture.git")
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
    install -D -m644 "95-dscapture.rules" "${pkgdir}/etc/udev/rules.d/95-dscapture.rules"
}
