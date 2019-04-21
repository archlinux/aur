# Maintainer: Ondřej Svoboda <ondrej@svobodasoft.cz>
pkgname=osdlyrics-python3-git
provides=(osdlyrics)
conflicts=(osdlyrics osdlyrics-pedrohlc osdlyrics-git)
_pkgver=0.4.99
pkgver=0.4.99.r926.818bac8
pkgrel=1
pkgdesc="Standalone lyrics fetcher/displayer (windowed and OSD mode). Supports MPRIS1/2 players, and MPD. (Python3 Version)"
arch=(i686 x86_64)
url="https://github.com/osdlyrics/osdlyrics"
license=('GPL3')
depends=('dbus-glib' 'python-dbus' 'python-gobject' 'python-pycurl'
         'python-future' 'libnotify')
makedepends=('intltool')
optdepends=('gobject-introspection-runtime: proxy detection in Gnome'
            'kdebindings-python: proxy detection in KDE'
            'python-mpd: to interface with MPD'
            'libappindicator-gtk2')
source=("git://github.com/osdlyrics/osdlyrics.git")
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/osdlyrics"
    printf "$_pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
    cd "$srcdir/osdlyrics"
    ./autogen.sh
    ./configure --prefix=/usr PYTHON=/usr/bin/python3
    make
}

package()
{
    cd "$srcdir/$provides"
    make DESTDIR="$pkgdir" install
}