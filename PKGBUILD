# Maintainer: Cauã Alvarenga Neves <cauaalvarenganeves@gmail.com>
# Upstream Developer: Mungai Njoroge <cwilvx (GitHub)>

_pkgname=swingmusic
pkgname="$_pkgname-bin"
pkgver=1.4.8
pkgrel=1
pkgdesc="Swing Music is a beautiful, self-hosted music player for your local audio files. Like a cooler Spotify ... but bring your own music."
arch=('x86_64')
url="https://swingmx.com/"
license=('MIT')
depends=()
provides=('swingmusic')
optdepends=('ffmpeg: audio silence skip feature')
conflicts=('swingmusic-beta-bin' 'swingmusic')

pkgver() {
    curl -s "https://api.github.com/repos/swingmx/swingmusic/releases/latest" |
        grep -Po '"tag_name": "\K.*?(?=")' | sed 's/^v//'
}

source=("https://github.com/swingmx/swingmusic/releases/download/v${pkgver}/swingmusic"
        "https://raw.githubusercontent.com/swingmx/swingmusic/refs/tags/v$pkgver/LICENSE")
sha256sums=('5d1e25b280fe8fe7340e4b01f005e614851c234ad214b33ef298369871cc59d1'
            '30b0f446384bbda0c6d6b8ca0655e3fe76194828ec4065a9ffffe876c8944fda')

package() {
    install -Dm755 "$srcdir/swingmusic" "$pkgdir/usr/bin/swingmusic"
    install -Dm644 "$srcdir/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
