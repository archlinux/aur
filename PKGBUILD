# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Plague-doctor <plague at privacyrequired dot com>
# Contributor: bacteriostat <dev dot bacteriostat at aleeas dot com>
# Credit for simplifying build goes to Martin Cihlář.

_pkgname=opentubex
pkgname=${_pkgname}-bin
pkgver=0.25.5
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

sha256sums_x86_64=('4d68bf5cef324b28e5f2d25fb10d0985b30904f8cfd7440b8f9bed11479337cf')
sha256sums_aarch64=('5bdee4d603ea292b7584104c94ffe2fce244e52b9c83a65d908cb1850a381f42')
