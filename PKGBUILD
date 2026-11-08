# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Plague-doctor <plague at privacyrequired dot com>
# Contributor: bacteriostat <dev dot bacteriostat at aleeas dot com>
# Credit for simplifying build goes to Martin Cihlář.

_pkgname=opentubex
_ghurl='https://github.com/OpenTubeX/OpenTubeX'
pkgname=${_pkgname}-bin
pkgver=0.37.4
pkgrel=2
pkgdesc="A highly customizable, privacy-focused desktop YouTube client"
arch=('x86_64' 'aarch64')
url='https://opentubex.org'
license=('AGPL-3.0-or-later')
options=('!strip')
depends=('alsa-lib' 'at-spi2-core' 'gtk3' 'libnotify' 'libsecret' 'libxss'
         'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('ffmpeg: Use the system FFmpeg when installed before first launch; configurable later in Settings'
            'yt-dlp: Use the system yt-dlp when installed before first launch; configurable later in Settings')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
changelog=opentubex.changelog

source_x86_64=("${pkgname}-${pkgver}-amd64.deb"::"$_ghurl/releases/download/v$pkgver-beta/${_pkgname}_${pkgver}_beta_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb"::"$_ghurl/releases/download/v$pkgver-beta/${_pkgname}_${pkgver}_beta_arm64.deb")

package() {
    bsdtar -xf data.tar.* -C "$pkgdir"
    # The deb can carry group- and world-writable modes; never install those.
    chmod -R u=rwX,go=rX "$pkgdir"
    install -d "$pkgdir/usr/bin"
    ln -s "/opt/OpenTubeX/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

sha256sums_x86_64=('aa3ddf26362e6a996b9d37f87448e1da29b19b8feebb01f1a649048e4f67b56d')
sha256sums_aarch64=('f87074411b2abe4b9c2de319f01e0df447f558955bf47c79ea17331e699a8ee8')
