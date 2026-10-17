# Maintainer: Dany Thinnes <dany@projekt-hirnfrei.de>
pkgname=hdmiviewer
pkgver=1.1.0
pkgrel=1
pkgdesc="Schlanker Qt6/C++ Live-Viewer für HDMI-Grabber (V4L2 + ALSA), Companion zu OBS Studio"
arch=('x86_64')
url="https://git.projekt-hirnfrei.de/diabolus/hdmiviewer"
license=('MIT')
depends=('qt6-base' 'alsa-lib')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0999f999f3b7cda71484c5d06074ba963406dc26dcc2928abbad1b94320cb809')

build() {
    # Der Ordnername im Archiv hängt von der Gitea-Instanz ab (meist
    # "hdmiviewer", nicht versioniert) - daher robust per Glob statt fest
    # verdrahtetem Pfad.
    cd "$srcdir"/*/
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$srcdir"/*/
    DESTDIR="$pkgdir" cmake --install build
}
