# Maintainer: Plague-doctor <plague at privacyrequired dot com >
# Co-maintainer: bacteriostat <dev dot bacteriostat at aleeas dot com>
# Credit for simplifying build goes to Martin Cihlář.

_pkgname=freetube
pkgname=${_pkgname}-bin
pkgver=0.22.1
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
    mkdir -p data
    bsdtar -x -f data.tar.xz -C data
}

package() {
    install -d "$pkgdir/usr/bin"
    cp -a  ${srcdir}/data/* ${pkgdir}/
    ln -s "/opt/FreeTube/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

md5sums_x86_64=('30ec39ed525d1bd1f0dbe68713614b35')
md5sums_aarch64=('7f4677c52645a860dc75ca9e6eacfbcf')
