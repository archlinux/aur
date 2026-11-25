# Maintainer: Nico <d3sox at protonmail dot com>

_pkgname=opentubex
_ghurl='https://github.com/OpenTubeX/OpenTubeX'
pkgname=${_pkgname}-nightly-bin
pkgver=0.38.1.nightly.3558
pkgrel=1
# Nightlies follow the release they are numbered after, so 0.37.0.nightly.2527
# sorts between 0.37.0 and 0.37.1. Earlier versions of this package used epoch 1.
epoch=1
if [[ "$pkgver" == *.nightly.* ]]; then
    _tag="v${pkgver/.nightly./-nightly-}"
    _asset_version=${_tag#v}
else
    _tag="v${pkgver}-beta"
    _asset_version="${pkgver}_beta"
fi
pkgdesc='A private desktop YouTube client, nightly channel'
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

source_x86_64=("${pkgname}-${pkgver}-amd64.deb"::"$_ghurl/releases/download/${_tag}/${_pkgname}_${_asset_version}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb"::"$_ghurl/releases/download/${_tag}/${_pkgname}_${_asset_version}_arm64.deb")

package() {
    bsdtar -xf data.tar.* -C "$pkgdir"
    # The deb can carry group- and world-writable modes; never install those.
    chmod -R u=rwX,go=rX "$pkgdir"
    install -d "$pkgdir/usr/bin"
    ln -s "/opt/OpenTubeX/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

sha256sums_x86_64=('9c64146530262c1123078e897dc9d0628837b247400ef7f7c2142856409d5372')
sha256sums_aarch64=('027d49f8e9190bc9401412e09eb2456a1fa6a0d1df0724d2c9baa50d980ae720')
