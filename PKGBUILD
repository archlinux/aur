# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=gst-plugins-openwebrtc-git
pkgver=v0.3.0.r37.f40f330
pkgrel=1
pkgdesc="OpenWebRTC specific GStreamer plugins"
arch=(i386 x86_64)
url="https://github.com/EricssonResearch/openwebrtc-gst-plugins"
license=('BSD')
groups=(gst-plugins)
depends=(gst-plugins-base-libs libusrsctp-git)
makedepends=(git)
provides=(gst-plugins-openwebrtc)
conflicts=(gst-plugins-openwebrtc)
source=('git+https://github.com/EricssonResearch/openwebrtc-gst-plugins.git')
md5sums=('SKIP')

_vcsname=openwebrtc-gst-plugins

pkgver() {
    cd "$srcdir/$_vcsname"
    printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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
