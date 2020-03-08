# Maintainer: illogical123 <illogical@protonmail.com>

pkgname=pdfpc-notes-current-slide
pkgver=4.4.0
_pkgver=$pkgver
pkgrel=1
pkgdesc='PDFPC with a patch to show the current slide with notes and the next one.'
arch=('x86_64')
url='https://pdfpc.github.io/'
license=('GPL')
depends=('gtk3' 'poppler-glib' 'libgee' 'gstreamer' 'gst-plugins-base')
optdepends=('gst-plugins-good: more codecs for video playback support'
            'gst-libav: more codecs for video playback support')
makedepends=('cmake' 'vala')
conflicts=('pdfpc')
source=("pdfpc-$_pkgver.tar.gz::https://github.com/pdfpc/pdfpc/archive/v$_pkgver.tar.gz"
"notes_current_page.patch")

sha256sums=('5fc457b081cdf02708436bb708940fd6b689e03fc336d3faab652f0b85592c00'
            '24c36f9caf736749d186b9a9027b855c5ddd1b5ee083e62dbc5b29198a1c7606')

prepare() {
    cd "$srcdir/pdfpc-$_pkgver"
    patch -Np1 -i "$srcdir/notes_current_page.patch"
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
