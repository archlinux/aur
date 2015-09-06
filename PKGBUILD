# Maintainer: Jonas Otten <jonadev95@posteo.org>

pkgname=mustang-plug
pkgver=1.2
pkgrel=1
pkgdesc='This software was created as a Linux replacement for Fender FUSE software for Fender Mustang guitar amplifier.'
url='https://bitbucket.org/piorekf/plug/wiki/Home'
license=('GPL')
arch=('x86_64')
depends=('libusb' 'qt4')
makedepends=('tar')
source=("http://de.archive.ubuntu.com/ubuntu/pool/universe/m/mustang-plug/${pkgname}_${pkgver}-${pkgrel}_amd64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
md5sums=('6ddb117e4277f0771ed0272e461c422a')

options=(!strip)

prepare() {
    cd "${srcdir}"
    ar x "${pkgname}_${pkgver}-${pkgrel}_amd64.deb"
}

package() {
    cd "${srcdir}"
    mkdir "${pkgdir}/usr"
    tar -C "${pkgdir}/usr" -xf data.tar.xz
    mv "${pkgdir}/usr/usr" "${pkgdir}/usr_tmp"
    mv "${pkgdir}/usr/lib" "${pkgdir}/usr_tmp/lib"
    rm -r "${pkgdir}/usr"
    mv "${pkgdir}/usr_tmp" "${pkgdir}/usr"
}
