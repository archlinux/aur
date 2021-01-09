pkgname=youtubemusic-bin
_pkgname=YoutubeMusicMusic-bin
pkgver=1.0.2
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_armv7h=1
_pkgrel_aarch64=1
pkgdesc="Youtube Music is a unofficial client to play your music."
arch=('x86_64' 'arm7h' 'aarch64')
url="https://gitlab.com/youtube-music/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('unzip')
conflicts=("youtube-git")
sha256sums_x86_64=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_aarch64=('SKIP')
source_x86_64=("https://gitlab.com/youtube-music/binaries/-/raw/master/YoutubeMusic-linux-x64.tar.gz")
source_armv7h=("https://gitlab.com/youtube-music/binaries/-/raw/master/YoutubeMusic-linux-armv7l.tar.gz")
source_aarch64=("https://gitlab.com/youtube-music/binaries/-/raw/master/YoutubeMusic-linux-arm64.tar.gz")


package() {
    for dir in YoutubeMusic-linux-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/opt/YoutubeMusic"
    cp -r ./ "$pkgdir/opt/YoutubeMusic"


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/YoutubeMusic" "$pkgdir/usr/bin/YoutubeMusic"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/resources/app/YoutubeMusic.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
