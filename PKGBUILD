# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=als
pkgname=${_pkgname}-dkms
pkgver=r27
pkgrel=1
pkgdesc="ASUS Zenbook ambient light sensor kernel module (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/danieleds/als"
license=('GPL2')
depends=('dkms' 'gcc' 'make')
optdepends=('linux-headers' 'linux-lts-headers')
makedepends=('git')
conflicts=("${_pkgname}-driver-git")
replaces=("${_pkgname}-driver-git")
provides=("${_pkgname}-driver-git")
install=${pkgname}.install

source=("$_pkgname::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s""$(git rev-list --count HEAD)"
}

prepare() {
    cd $_pkgname
    sed -i 's|PACKAGE_VERSION="[^"]*"|PACKAGE_VERSION="'$pkgver'"|' dkms.conf
}

package() {
    install -d "$pkgdir"/usr/src/${_pkgname}-${pkgver}
    cp -r ${_pkgname}/{Makefile,${_pkgname}.c,dkms.conf} "$pkgdir"/usr/src/${_pkgname}-${pkgver}/
}
