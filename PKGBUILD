# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Plague-doctor <plague at privacyrequired dot com>
# Contributor: bacteriostat <dev dot bacteriostat at aleeas dot com>
# Credit for simplifying build goes to Martin Cihlář.

_pkgname=opentubex
_ghurl='https://github.com/OpenTubeX/OpenTubeX'
pkgname=${_pkgname}-bin
pkgver=0.38.2
pkgrel=1
pkgdesc="A highly customizable, privacy-focused desktop YouTube client"
arch=('x86_64' 'aarch64')
url='https://opentubex.org'
license=('AGPL-3.0-or-later')
options=('!strip')
depends=('ttf-liberation' 'alsa-lib' 'at-spi2-core' 'gtk3' 'libnotify' 'libsecret' 'libxss'
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

sha256sums_x86_64=('3eb3f2c4f7b9c8c67c32e24399fe17c65ab7f7e9a90669131ec4a8a8c13ab693')
sha256sums_aarch64=('8c5eeb7bc0d6b42d83967fc8da45ed962cd9b9f6e1b43718397ef00a04aab63a')
