# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

_pkgname=youtube-viewer
pkgname=gtk-youtube-viewer
pkgver=3.2.5
pkgrel=1
pkgdesc="A Gtk2 application for searching and streaming videos from YouTube."
arch=('any')
url="https://github.com/trizen/youtube-viewer"
license=('Artistic2.0')
makedepends=('perl-module-build')

provides=('youtube-viewer')
conflicts=('youtube-viewer' 'youtube-viewer-git')

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

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/trizen/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('306199649972137e7181fac4efccb295b5c3aedc3f103975cca533db3be1f53b')

package() {
    cd "$_pkgname-$pkgver"
    /usr/bin/perl Build.PL --destdir "$pkgdir" --installdirs vendor --gtk
    ./Build
    ./Build test
    ./Build install --install_path script=/usr/bin

    install -Dm 644 "share/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm 644 "share/icons/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
