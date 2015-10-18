# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname=sedutil
pkgver=1.00
pkgrel=1
pkgdesc="TCG OPAL 2.00 SED Management Program"
arch=('i686' 'x86_64')
url="https://github.com/Drive-Trust-Alliance/sedutil"
license=('GPL3')
install=sedutil.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Drive-Trust-Alliance/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7d9c8b3eb408de8218e8bd29f118a8956157ca6e80fb0d8782074302cc13d2e8')
PKGEXT='.pkg.tar'
CPPFLAGS="$CPPFLAGS -O2"

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/linux/CLI/"
    make
    cd "${srcdir}/${pkgname}-${pkgver}/LinuxPBA/"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    install -Dm755 "linux/CLI/dist/Debug_i686/GNU-Linux-x86/sedutil-cli" "${pkgdir}/usr/bin/sedutil-cli"
    install -Dm644 "linux/PSIDRevert_LINUX.txt" "${pkgdir}/usr/share/doc/${pkgname}/PSIDRevert.txt"
    install -Dm755 "LinuxPBA/dist/Debug/GNU-Linux-x86/linuxpba" "${pkgdir}/usr/bin/linuxpba"
}
