# Maintainer: Chris Hobbs (RX14) <chris@rx14.co.uk>

pkgname=nadeshiko
pkgver=2.5.6
pkgrel=2
pkgdesc="A Linux tool to cut short videos with ffmpeg"
arch=('any')
url="https://github.com/deterenkelt/$pkgname"
license=('GPL3')
depends=("bc" "xdg-user-dirs" "ffmpeg" "mediainfo" "perl-file-mimeinfo" "mkvtoolnix-cli" "time" "wget"
         "xmlstarlet" "inotify-tools" "lsof" "jq" "socat" "python-gobject")
optdepends=("libnotify: desktop notifications"
            "mpv: nadeshiko-mpv script"
            "gtk3: nadeshiko-mpv script")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/deterenkelt/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2159c8d35d160c0721fb42615fc17c8052d3b98d94be8dd867136fd718ab63a3')

prepare() {
    cd $srcdir/Nadeshiko-$pkgver

    sed -i 's/check_for_updates=yes/check_for_updates=no/' exampleconf/example.nadeshiko.rc.sh

    # Workaround for https://github.com/deterenkelt/Nadeshiko/issues/15
    sed -i 's/libvpx_auto_alt_ref=6/libvpx_auto_alt_ref=1/' exampleconf/example.nadeshiko.rc.sh
}

package() {
    cd $srcdir/Nadeshiko-$pkgver

    make -f packaging/gentoo/Makefile install DESTDIR="$pkgdir" PREFIX=/usr
}
