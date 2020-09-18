# Maintainer: zan <zan@420blaze.it>
# Contributor: Jacob Henner <code@ventricle.us>
# Contributor: Eduardo Sánchez Muñoz
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: BlackEagle <ike.devolder@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

# Based on community/clementine PKGBUILD

pkgname=clementine-git
pkgver=1.4.0rc1.r329.gf7bece3b8.0.gf7bece3b8
pkgrel=1
pkgdesc='A modern music player and library organizer'
url='http://www.clementine-player.org/'
license=(GPL)
arch=(x86_64)
depends=(chromaprint glew gst-plugins-base-libs libmygpo-qt5 protobuf qt5-x11extras)
makedepends=(boost cmake git)
optdepends=('libcdio: for CD support'
            'libgpod: for iPhone and iPod Touch support'
            'liblastfm-qt5: for LastFM support'
            'libmtp: for MTP support'
            'crypto++: for Spotify plugin')
conflicts=(clementine)
provides=(clementine)
_name=Clementine
source=("git+https://github.com/clementine-player/$_name.git")
sha256sums=('SKIP')

pkgver() {
    cd $_name
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_name \
    -DENABLE_SPOTIFY_BLOB=off \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
