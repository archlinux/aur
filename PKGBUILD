# Maintainer: Jacob Henner <code@ventricle.us>
# Contributor: Eduardo Sánchez Muñoz
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: BlackEagle <ike.devolder@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

# Based on community/clementine PKGBUILD

pkgname=clementine-git
pkgver=1.3.1.r963.gfb51e7733
pkgrel=1
pkgdesc='A modern music player and library organizer'
url='http://www.clementine-player.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('crypto++' 'chromaprint' 'desktop-file-utils' 'glew' 'gst-plugins-base-libs' 'libmygpo-qt5' 'protobuf' 'qt5-x11extras')
makedepends=('boost' 'cmake' 'git')
optdepends=('libcdio: for CD support'
                       'libgpod: for iPhone and iPod Touch support'
                       'liblastfm-qt5: for LastFM support'
                       'libmtp: for MTP support')
conflicts=('clementine')
provides=('clementine')
replaces=('clementine-qt5-git')
_name=Clementine
source=("git+https://github.com/clementine-player/$_name.git")
sha256sums=('SKIP')

pkgver() {
    cd $srcdir/$_name
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"
    cmake "$srcdir/$_name" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DENABLE_SPOTIFY_BLOB=off
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install
}
