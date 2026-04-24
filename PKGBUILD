# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Plague-doctor <plague at privacyrequired dot com>
# Contributor: bacteriostat <dev dot bacteriostat at aleeas dot com>
# Credit for simplifying build goes to Martin Cihlář.

_pkgname=opentubex
pkgname=${_pkgname}-bin
pkgver=0.25.0
pkgrel=1
pkgdesc="A fork of the open source desktop YouTube player FreeTube with additional features"
arch=('x86_64' 'aarch64')
url='https://github.com/OpenTubeX/OpenTubeX'
license=('AGPL3')
options=('!strip' 'staticlibs')
depends=('ttf-liberation')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${pkgname}-${pkgver}-amd64.deb"::"$url/releases/download/v$pkgver-beta/${_pkgname}_${pkgver}_beta_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb"::"$url/releases/download/v$pkgver-beta/${_pkgname}_${pkgver}_beta_arm64.deb")

prepare() {
    mkdir -p data
    bsdtar -x -f data.tar.xz -C data
}

package() {
    install -d "$pkgdir/usr/bin"
    cp -a  ${srcdir}/data/* ${pkgdir}/
    ln -s "/opt/OpenTubeX/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

sha256sums_x86_64=('b13fc43052a4b9fc75dd5db40acd00a323deee5c2e827a53c19749a10fbb1c49')
sha256sums_aarch64=('893e0e6c10e0ad71a66c3a1122ca4ef869201c9e6c0d7d2deef4ce9be42b597c')
