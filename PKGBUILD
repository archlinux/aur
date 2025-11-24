# Maintainer: Mokshit Bindal <your-email@example.com>

pkgname=spotify-downloader
pkgver=1.0.2
pkgrel=1
pkgdesc="Download Spotify playlists, albums, and tracks in FLAC/MP3 format from free sources with beautiful terminal UI"
arch=('any')
url="https://github.com/MokshitBindal/Spotify_Downloader"
license=('MIT')
depends=('python' 'python-pip' 'ffmpeg')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=(
    'yt-dlp: YouTube download support'
    'python-spotipy: Spotify API access'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MokshitBindal/Spotify_Downloader/archive/v${pkgver}.tar.gz")
sha256sums=('bbbbf9633a607543e45494af2469495895a262925bda2f31150a2f3028d6c8df')

build() {
    cd "${srcdir}/Spotify_Downloader-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/Spotify_Downloader-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
