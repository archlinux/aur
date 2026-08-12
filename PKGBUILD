# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Plague-doctor <plague at privacyrequired dot com>
# Contributor: bacteriostat <dev dot bacteriostat at aleeas dot com>
# Credit for simplifying build goes to Martin Cihlář.

_pkgname=opentubex
_ghurl='https://github.com/OpenTubeX/OpenTubeX'
pkgname=${_pkgname}-bin
pkgver=0.31.0
pkgrel=2
pkgdesc="A highly customizable, privacy-focused desktop YouTube client"
arch=('x86_64' 'aarch64')
url='https://opentubex.org'
license=('AGPL3')
options=('!strip' 'staticlibs')
depends=('ttf-liberation')
optdepends=('ffmpeg: Use the system FFmpeg when installed before first launch; configurable later in Settings'
            'yt-dlp: Use the system yt-dlp when installed before first launch; configurable later in Settings')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${pkgname}-${pkgver}-amd64.deb"::"$_ghurl/releases/download/v$pkgver-beta/${_pkgname}_${pkgver}_beta_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb"::"$_ghurl/releases/download/v$pkgver-beta/${_pkgname}_${pkgver}_beta_arm64.deb")

prepare() {
    mkdir -p data
    bsdtar -x -f data.tar.xz -C data
}

package() {
    install -d "$pkgdir/usr/bin"
    cp -a ${srcdir}/data/* ${pkgdir}/
    ln -s "/opt/OpenTubeX/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

sha256sums_x86_64=('2cf28059313d4f0056f6e2d106634ffc4d5e1505ae6939bb94e1f37052b4a2ae')
sha256sums_aarch64=('80a1719fe4ebbde644481e7766f89700afe4db0916d49553a2dd800cc11f89d5')
