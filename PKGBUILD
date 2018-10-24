# Maintainer: Alejandro Díaz-Caro <alejandro@diaz-caro.info>

pkgname=pdfpc-notimer
pkgver=4.2.1
_pkgver=$pkgver
pkgrel=2
pkgdesc='PDFPC with a patch to not show the timer in the presentations.'
arch=('x86_64')
url='https://pdfpc.github.io/'
license=('GPL')
depends=('gtk3' 'poppler-glib' 'libgee' 'gstreamer' 'gst-plugins-base')
optdepends=('gst-plugins-good: more codecs for video playback support'
            'gst-libav: more codecs for video playback support')
makedepends=('cmake' 'vala')
conflicts=('pdfpc')
source=("pdfpc-$_pkgver.tar.gz::https://github.com/pdfpc/pdfpc/archive/v$_pkgver.tar.gz"
"notimer.patch")

sha256sums=('f67eedf092a9bc275dde312f3166063a2e88569f030839efc211127245be6df8'
            '79d728ca0d88c6d2007643d6b528d5a5aa4c144008143f3bd00d7b419256860b')

prepare() {
    cd "$srcdir/pdfpc-$_pkgver"
    patch -Np1 -i "$srcdir/notimer.patch" ## do not print the timer
    ## see https://bugs.archlinux.org/task/58786
}

build() {
    cd "$srcdir/pdfpc-$_pkgver"
    cmake  -DCMAKE_INSTALL_PREFIX="/usr/" -DSYSCONFDIR="/etc" .
    make
}

package() {
    cd "$srcdir/pdfpc-$_pkgver"
    make DESTDIR="$pkgdir/" install
}

# vim:set ts=4 sw=4 et:
