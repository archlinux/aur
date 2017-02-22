# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

_pkgname=youtube-viewer
pkgname=gtk-youtube-viewer-git
pkgver=3.2.5.2.g423f658
pkgrel=1
pkgdesc="A Gtk2 application for searching and streaming videos from YouTube (-git version)."
arch=('any')
url="https://github.com/trizen/youtube-viewer"
license=('Artistic2.0')
makedepends=('git' 'perl-module-build')

provides=('youtube-viewer' 'gtk-youtube-viewer')
conflicts=('youtube-viewer' 'youtube-viewer-git' 'gtk-youtube-viewer')

depends=('perl>=5.16.0' 'perl-data-dump' 'perl-json' 'perl-lwp-protocol-https' 'perl-libwww' 'gtk2-perl' 'perl-file-sharedir')

optdepends=(
            'perl-json-xs: faster JSON to HASH conversion'
            'perl-lwp-useragent-cached: cache support'
            'perl-unicode-linebreak: to print the results in a fixed-width format (-W)'
            'perl-term-readline-gnu: for better STDIN support'
            'youtube-dl: for playing videos with encrypted signatures'
            'wget: for downloading videos with wget'
            'mplayer: for playing videos with MPlayer'
            'vlc: for playing videos with VLC'
            'smplayer: for playing videos with SMPlayer'
            'mpv: for playing videos with MPV (recommended)'
            'gnome-icon-theme: for icons in menus'
            )

source=('git://github.com/trizen/youtube-viewer.git')
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --always | sed -e 's|-|.|g'
}

package() {
    cd $_pkgname
    /usr/bin/perl Build.PL --destdir "$pkgdir" --installdirs vendor --gtk
    ./Build
    ./Build test
    ./Build install --install_path script=/usr/bin

    install -Dm 644 "share/gtk-youtube-viewer.desktop" "$pkgdir/usr/share/applications/gtk-youtube-viewer.desktop"
    install -Dm 644 "share/icons/gtk-youtube-viewer.png" "$pkgdir/usr/share/pixmaps/gtk-youtube-viewer.png"
}
