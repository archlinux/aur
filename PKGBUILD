# Maintainer: Christopher Rosell <chrippa@gmail.com>
# Contributor: Army
# Contributor: tomegun

pkgname=rtmpdump-git
pkgver=0.499.a107cef
pkgrel=1
pkgdesc="A tool to download rtmp and rtmpe streams"
url="http://rtmpdump.mplayerhq.hu/"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
depends=('openssl')
makedepends=('git')
provides=('rtmpdump')
conflicts=('rtmpdump')
source=("git+git://git.ffmpeg.org/rtmpdump")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/rtmpdump"
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
    cd "$srcdir/rtmpdump"
    make OPT="$CFLAGS" XLDFLAGS="$LDFLAGS"
}

package() {
    cd "$srcdir/rtmpdump"

    install -dm755 "$pkgdir/usr/lib"

    make prefix=/usr \
         sbindir=/usr/bin \
         mandir=/usr/share/man \
         DESTDIR="$pkgdir" \
         install
}

# vim:set ts=2 sw=2 et:
