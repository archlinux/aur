# Maintainer: Nico <d3sox at protonmail dot com>

_pkgname=opentubex
_ghurl='https://github.com/OpenTubeX/OpenTubeX'
pkgname=${_pkgname}-nightly-bin
pkgver=0.37.0nightly.2497
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

sha256sums_x86_64=('76f6915f2a9a41aa8188b4d762d873f2d9bc68f00f83d21f06edef94c1fc2e9d')
sha256sums_aarch64=('735dec47266e965159d95e0c0f9bcf8ad8f7c1e216bf17a8904d74f4e98188df')
