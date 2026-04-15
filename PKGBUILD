# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Plague-doctor <plague at privacyrequired dot com>
# Contributor: bacteriostat <dev dot bacteriostat at aleeas dot com>
# Credit for simplifying build goes to Martin Cihlář.

_pkgname=opentubex
pkgname=${_pkgname}-bin
pkgver=0.24.5
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

sha256sums_x86_64=('e471ea08f09a92f8b33349caf81bbfc41c268f19682f7d914e6e3e9cb432b405')
sha256sums_aarch64=('7451e49223566a89fe4ed7237c134b1fdf72dacf5063589228c57d8bd87cac96')
