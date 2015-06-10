# Maintainer: Prurigro
# Contributor: Prurigro

pkgname=cryptobox
pkgver=20140529.r9.f32decc
pkgrel=2
pkgdesc="A simple frontend script for creating, mounting and umounting luks encrypted disk images"
url="https://github.com/prurigro/${pkgname}"
license=('GPL3')
depends=('coreutils' 'cryptsetup' 'util-linux')
makedepends=('git')
arch=('any')

source=("git://github.com/prurigro/${pkgname}.git#branch=master" "${pkgname}.1")
sha512sums=('SKIP' 'cdbe0bd873401c4d366318cef784969f70004baf7760aadba96c109d3879faa3456f3c0ff00466539a27ff8ad96a785d12cea4376eda4d06999839ba9b3db256')

pkgver() {
    cd $pkgname
    printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm644 ${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
    install -Dm755 ${pkgname}/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
