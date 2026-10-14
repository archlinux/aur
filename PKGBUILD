# Maintainer: Nico <d3sox at protonmail dot com>

_pkgname=opentubex
_ghurl='https://github.com/OpenTubeX/OpenTubeX'
pkgname=${_pkgname}-nightly-bin
pkgver=0.36.0.nightly.2111
pkgrel=1
_version=${pkgver//.nightly./-nightly-}
pkgdesc='A private desktop YouTube client, nightly build'
arch=('x86_64' 'aarch64')
url='https://opentubex.org'
license=('AGPL3')
options=('!strip' 'staticlibs')
depends=('ttf-liberation')
optdepends=('ffmpeg: Use the system FFmpeg when installed before first launch; configurable later in Settings'
            'yt-dlp: Use the system yt-dlp when installed before first launch; configurable later in Settings')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${pkgname}-${pkgver}-amd64.deb"::"$_ghurl/releases/download/v${_version}/${_pkgname}_${_version}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb"::"$_ghurl/releases/download/v${_version}/${_pkgname}_${_version}_arm64.deb")

prepare() {
    mkdir -p data
    bsdtar -x -f data.tar.xz -C data
}

package() {
    install -d "$pkgdir/usr/bin"
    cp -a "$srcdir/data/." "$pkgdir/"
    ln -s "/opt/OpenTubeX/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

sha256sums_x86_64=('2e04f3f16d12fa8c3865b4a8119a159fd7ce24987249eb259935be2f65ecdfb3')
sha256sums_aarch64=('9afbf0bb73eb1703b1036583f0c73c5a1c44f90fdc717f93154bc1e067bcc330')
