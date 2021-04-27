# Maintainer: Plague-doctor <plague at privacyrequired dot com >
# Credit for simplifying build goes to Martin Cihlář.

_pkgname=freetube
pkgname=${_pkgname}-bin
pkgver=0.12.0
pkgrel=4
pkgdesc="An open source desktop YouTube player built with privacy in mind."
arch=('x86_64' 'aarch64')
url="https://github.com/FreeTubeApp/FreeTube"
license=('AGPL3')
options=("!strip" "staticlibs")
provides=("${_pkgname}" "${_pkgname}-git")
conflicts=("${_pkgname}" "${_pkgname}-git")

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

md5sums_x86_64=('60379f72ea6989790e2a4a61f334f45b')
md5sums_aarch64=('6225daef75f523d92d836200ae35abbd')
