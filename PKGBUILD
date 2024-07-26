# Maintainer: Plague-doctor <plague at privacyrequired dot com >
# Credit for simplifying build goes to Martin Cihlář.

_pkgname=freetube
pkgname=${_pkgname}-bin
pkgver=0.21.2
pkgrel=1
pkgdesc="An open source desktop YouTube player built with privacy in mind."
arch=('x86_64' 'aarch64')
url='https://github.com/FreeTubeApp/FreeTube'
license=('AGPL3')
options=('!strip' 'staticlibs')
depends=('ttf-liberation')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${pkgname}-${pkgver}-amd64.deb"::"$url/releases/download/v$pkgver-beta/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb"::"$url/releases/download/v$pkgver-beta/${_pkgname}_${pkgver}_arm64.deb")

prepare() {
    mkdir data
    bsdtar -x -f data.tar.xz -C data
}

package() {
    install -d "$pkgdir/usr/bin"
    cp -a  ${srcdir}/data/* ${pkgdir}/
    ln -s "/opt/FreeTube/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

md5sums_x86_64=('d6c4c37e14ee53930a73d30daa4d91bd')
md5sums_aarch64=('e81bcad1f804a75fc725e4fa3c7aa5ff')
