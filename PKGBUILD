# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=gst-plugins-openwebrtc-git
pkgver=r127.f40f330
pkgrel=1
pkgdesc="OpenWebRTC specific GStreamer plugins"
arch=(i386 x86_64)
url="https://github.com/EricssonResearch/openwebrtc-gst-plugins"
license=('BSD')
depends=(gst-plugins-base-libs libusrsctp-git)
makedepends=(git)
provides=(gst-plugins-openwebrtc)
conflicts=(gst-plugins-openwebrtc)
source=('git+https://github.com/EricssonResearch/openwebrtc-gst-plugins.git')
md5sums=('SKIP')

_vcsname=openwebrtc-gst-plugins

pkgver() {
    cd "$srcdir/$_vcsname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_vcsname"
    ./autogen.sh
    ./configure --prefix=/usr
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
