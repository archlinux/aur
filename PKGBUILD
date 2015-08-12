pkgname=rtmpdump-ksv-git
_gitname=rtmpdump
pkgver=r499.a107cef
pkgrel=2
pkgdesc="A version of rtmpdump-git including numerous patches released by KSV."
arch=('i686' 'x86_64')
url="http://stream-recorder.com/forum/-t16103.html"
license=('GPL2' 'LGPL2.1')
depends=('openssl')
conflicts=('rtmpdump' 'rtmpdump-svn' 'rtmpdump-git' 'rtmpdump-ksv')
provides=('rtmpdump' 'rtmpdump-git')
source=('git://git.ffmpeg.org/rtmpdump' 'Patch.diff')
sha256sums=('SKIP' '106ce20cad83d5aae11c9359f9c505f5ca870790385ef57a08be1439e9c91d16')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "$srcdir/$_gitname"
    patch -p0 -i "$srcdir/Patch.diff"
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -d -m755 "${pkgdir}/usr/lib"
  make prefix=/usr sbindir=/usr/bin \
    mandir=/usr/share/man DESTDIR="$pkgdir" \
    install
}
