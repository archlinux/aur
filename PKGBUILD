# Maintainer: Taiko2k <captain dot gxj at gmail dot com>

pkgname=tauon-music-box
_pkgname=tauonmb
_gitname=TauonMusicBox
pkgver=6.4.7
pkgrel=1
pkgdesc="A modern streamlined music player"
arch=('any')
url="https://tauonmusicbox.rocks"
license=('GPL3')

depends=('python-pillow'
         'python-pylast'
         'python-hsaudiotag3k' # AUR
         'python-pysdl2' # AUR
         'python-stagger' # AUR
         'python-send2trash'
         'python-pylyrics' # AUR
         'python-musicbrainzngs'
         'python-isounidecode' # AUR
         'python-setproctitle'
         'python-gobject'
         'python-cairo'
         'python-beautifulsoup4'
         'python-requests'
         'python-dbus'
         'python-pulse-control' # AUR
         'ffmpeg'
         'flac'
         'gst-plugins-good'
         'gst-plugins-bad'
         'noto-fonts-extra'
         'noto-fonts-cjk'
         'sdl2_image'
         'xdg-utils'
         'mpg123'
         'libpulse'
         'opusfile'
         'libvorbis'
         'libappindicator-gtk3'
         )
         
optdepends=('p7zip: 7z archive extraction support'
            'unrar: RAR archive extraction support'
            'python-plexapi: Plex streaming'
            'python-pypresence: Discord status support'
            'python-tekore: Spotify playback control'
            'picard: Recommended tag editor'
            'gst-plugins-ugly: For GStreamer WMA support'
            )
            
source=("$pkgname-$pkgver.tar.gz::https://github.com/Taiko2k/TauonMusicBox/archive/v$pkgver.tar.gz")


build() {
    cd "$_gitname-$pkgver"
    python compile-translations.py
    bash compile-phazor.sh
}

package() {
    cd "$_gitname-$pkgver"
    install -Dm755 tauon.py -t "$pkgdir/opt/$pkgname"
    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/tauon.py" "$pkgdir/usr/bin/$_pkgname"
 
    install -Dm644 input.txt -t "$pkgdir/opt/$pkgname"
    cp -r  assets templates theme t_modules lib "$pkgdir/opt/$pkgname"
 
    for t in de fr_FR ja_JP nb_NO pt pt_BR pt_PT sv zh_CN; do
        install -Dm644 locale/${t}/LC_MESSAGES/*.mo -t "$pkgdir/usr/share/locale/${t}/LC_MESSAGES"
    done
 
    install -Dm644 "extra/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "extra/$_pkgname-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
    install -Dm644 "extra/$_pkgname.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm755 "extra/tauonmb.sh" "$pkgdir/opt/$pkgname/tauonmb.sh"
    install -Dm755 "extra/tauonmb.sh" "$pkgdir/usr/bin/tauon"
}

md5sums=('abe277db4d3c6ea8597ad2d8e97fbc1d')
