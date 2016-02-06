# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=openwebrtc-git
pkgver=v0.3.0.r151.37b507c
pkgrel=1
pkgdesc="A mobile-first WebRTC client framework for building native apps"
arch=(i386 x86_64)
url="https://github.com/EricssonResearch/openwebrtc"
license=('BSD')
depends=(libnice libpulse gst-plugins-openwebrtc)
makedepends=(git gtk-doc)
provides=(openwebrtc)
conflicts=(openwebrtc)
source=('git+https://github.com/EricssonResearch/openwebrtc.git')
md5sums=('SKIP')

_vcsname=openwebrtc

pkgver() {
    cd "$srcdir/$_vcsname"
    printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/$_vcsname"
    ./autogen.sh --prefix=/usr --enable-bridge=no --enable-introspection=no --enable-debug=no --enable-tests=no
    make
}

check() {
    cd "$srcdir/$_vcsname"
    make -k check
}

package() {
    cd "$srcdir/$_vcsname"
    make DESTDIR="$pkgdir/" install
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
