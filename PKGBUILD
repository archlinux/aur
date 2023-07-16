# Maintainer: zan <zan@nie.rs>
# Contributor: Jacob Henner <code@ventricle.us>
# Contributor: Eduardo Sánchez Muñoz
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: BlackEagle <ike.devolder@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

# Based on community/clementine PKGBUILD

pkgname=clementine-git
pkgver=1.4.0rc1.r886.g6ff576863.0.g6ff576863
pkgrel=1
pkgdesc='A modern music player and library organizer'
url='http://www.clementine-player.org/'
license=(GPL)
arch=(x86_64)
depends=(chromaprint glew gst-plugins-base-libs libmygpo-qt5 protobuf qt5-x11extras)
makedepends=(boost cmake git)
optdepends=('fftw: moodbar support'
            'libcdio: Audio CD support'
            'libgpod: iPod and iPhone support'
            'liblastfm-qt5: LastFM support'
            'libmtp: MTP support'
            'sparsehash: Box, Dropbox, Google Drive, Seafile, Skydrive support'
            'qt5-tools: translations')
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
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
