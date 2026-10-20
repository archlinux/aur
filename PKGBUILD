# Maintainer: Nico <d3sox at protonmail dot com>

_pkgname=opentubex
_ghurl='https://github.com/OpenTubeX/OpenTubeX'
pkgname=${_pkgname}-nightly-bin
pkgver=0.36.1nightly.2254
pkgrel=1
# The old .nightly. versions sort after stable versions of the same release.
epoch=1
if [[ "$pkgver" == *nightly.* ]]; then
    _tag="v${pkgver/nightly./-nightly-}"
    _asset_version=${_tag#v}
else
    _tag="v${pkgver}-beta"
    _asset_version="${pkgver}_beta"
fi
pkgdesc='A private desktop YouTube client, nightly channel'
arch=('x86_64' 'aarch64')
url='https://opentubex.org'
license=('AGPL3')
options=('!strip' 'staticlibs')
depends=('ttf-liberation')
optdepends=('ffmpeg: Use the system FFmpeg when installed before first launch; configurable later in Settings'
            'yt-dlp: Use the system yt-dlp when installed before first launch; configurable later in Settings')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${pkgname}-${pkgver}-amd64.deb"::"$_ghurl/releases/download/${_tag}/${_pkgname}_${_asset_version}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb"::"$_ghurl/releases/download/${_tag}/${_pkgname}_${_asset_version}_arm64.deb")

prepare() {
    mkdir -p data
    bsdtar -x -f data.tar.xz -C data
}

package() {
    install -d "$pkgdir/usr/bin"
    cp -a "$srcdir/data/." "$pkgdir/"
    ln -s "/opt/OpenTubeX/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

sha256sums_x86_64=('d0883625aac3c59a69074eb3ac46719bbaa2de16fa0296a16d79101225a95028')
sha256sums_aarch64=('7aac611b839edd43fe24ffb2f8b76ff452edf13b03f01c562e9a9fbc68e9bf50')
