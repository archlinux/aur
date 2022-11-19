pkgname=youtubemusic
_pkgname=YoutubeMusic
pkgver=1.0.5
pkgrel=1
pkgdesc="Youtube Music is a unofficial client to play your music."
arch=('any')
url="https://gitlab.com/youtube-music/application"
arch=('any')
license=('GPL')
conflicts=("youtube-bin")
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
source=("git+https://gitlab.com/youtube-music/application.git")
sha256sums=('SKIP')


package() {
    cd "$srcdir/application"
    cat <<EOT >> YoutubeMusic
    #!/bin/bash
    cd /opt/YoutubeMusic &&
    npm start
EOT

    chmod +x YoutubeMusic
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application"
    install -dm755 "$pkgdir/opt/YoutubeMusic"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/YoutubeMusic"
    cp -r "$pkgdir/opt/YoutubeMusic/youtubemusic.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/YoutubeMusic/YoutubeMusic" "$pkgdir/usr/bin/YoutubeMusic"

    # Desktop Entry
    install -Dm644 "$srcdir/application/YoutubeMusic.desktop" \
        "$pkgdir/usr/share/applications/YoutubeMusic.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/YoutubeMusic.desktop"
}