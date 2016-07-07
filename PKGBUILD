# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=gst-plugins-openwebrtc
_remote=openwebrtc-gst-plugins
pkgver=0.3.0
pkgrel=1
pkgdesc="OpenWebRTC specific GStreamer plugins"
arch=(i386 x86_64)
url="https://github.com/EricssonResearch/openwebrtc-gst-plugins"
license=('BSD')
groups=(gst-plugins)
depends=(gst-plugins-base-libs libusrsctp)
provides=(gst-plugins-openwebrtc)
conflicts=(gst-plugins-openwebrtc-git)
source=("https://github.com/EricssonResearch/$_remote/archive/v$pkgver.tar.gz")
sha256sums=('72829906ad3d588cf0a260712a74b25ffd773ea623f67b9d4423da32e07e4180')

build() {
    cd "$srcdir/$_remote-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/$_remote-$pkgver"
    make -k check
}

package() {
    cd "$srcdir/$_remote-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
