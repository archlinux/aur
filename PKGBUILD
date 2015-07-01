# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

_pkgname=youtube-viewer
pkgname=gtk-youtube-viewer
pkgver=3.1.9
pkgrel=1
pkgdesc="A Gtk2 application for searching and streaming videos from YouTube."
arch=('any')
url="https://github.com/trizen/youtube-viewer"
license=('GPLv3')
makedepends=('git')

provides=('youtube-viewer')
conflicts=('youtube-viewer')

depends=('perl>=5.16.0' 'perl-data-dump' 'perl-json' 'perl-lwp-protocol-https' 'perl-libwww' 'gtk2-perl' 'perl-file-sharedir')

optdepends=(
            'perl-json-xs: faster JSON to HASH conversion'
            'perl-lwp-useragent-cached: cache support'
            'perl-text-charwidth: to print the results in a fixed-width format (-W)'
            'perl-term-readline-gnu: for better STDIN support'
            'youtube-dl: for playing videos with encrypted signatures'
            'wget: for downloading videos with wget'
            'mplayer: for playing the videos with MPlayer'
            'vlc: for playing the videos with VLC'
            'mpv: for playing the videos with MPV (recommended)'
            )

source=('git://github.com/trizen/youtube-viewer.git')
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --always | sed -e 's|-|.|g'
}

package() {
    cd $_pkgname
    perl Build.PL --destdir "$pkgdir" --installdirs vendor --gtk-youtube-viewer
    ./Build
    ./Build test
    ./Build install --install_path script=/usr/bin

    install -Dm 644 "share/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm 644 "share/icons/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
