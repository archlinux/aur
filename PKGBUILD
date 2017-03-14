# Maintainer: Eduardo Sánchez Muñoz
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: BlackEagle <ike.devolder@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

# Based on community/clementine PKGBUILD

pkgname=clementine-git
pkgver=1.3.1.r312.gf7eea6c50
pkgrel=1
pkgdesc='A modern music player and library organizer'
url='http://www.clementine-player.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('chromaprint' 'crypto++' 'fftw' 'gcc-libs' 'glew' 'glib2' 'glibc'
         'gst-plugins-base-libs' 'gstreamer' 'libcdio' 'libgl' 'libgpod'
         'liblastfm' 'libmtp' 'libpulse' 'libx11' 'protobuf' 'qjson' 'qt4'
         'sqlite' 'taglib' 'zlib')
makedepends=('boost' 'cmake' 'mesa' 'sparsehash' 'git')
optdepends=('gst-plugins-base: "Base" plugin libraries'
            'gst-plugins-good: "Good" plugin libraries'
            'gst-plugins-bad: "Bad" plugin libraries'
            'gst-plugins-ugly: "Ugly" plugin libraries'
            'gst-libav: Libav plugin'
            'gvfs: Various devices support')
source=("git+https://github.com/clementine-player/Clementine.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Clementine"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/Clementine"
}

build() {
    mkdir -p "$srcdir/clementine-build"
    cd "$srcdir/clementine-build"
    
    cmake "$srcdir/Clementine" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_WERROR=off \
        -DCMAKE_INSTALL_PREFIX="/usr"
    make
}

package() {
    cd "$srcdir/clementine-build"
    
    make DESTDIR="$pkgdir" install
}
