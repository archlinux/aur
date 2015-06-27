# Maintainer: spider-mario <spidermario@free.fr>
pkgname=composer-git
pkgver=2.0rc1.8.g42f058a
epoch=1
pkgrel=1
pkgdesc="Song editor for karaoke games"
arch=(i686 x86_64)
url="http://performous.org/composer"
license=(GPL)
depends=(qt5-multimedia ffmpeg)
makedepends=(git cmake)
provides=(composer)
conflicts=(composer)
source=(cmake.patch
        git+https://github.com/performous/composer.git)
sha512sums=(b9327a41bfb1e80eadf2bb64a937fc283414b897450925f981256ffcf6967aa845860eb40a683c523d8e71a426d77027d6abf7be85218657705c888ffea55406
            814f22ec5c640ea4f23fc1dad192cc3393632aa544e20c6f35d6d6963dbbc711b9b68433da0fcebcd91611947824978c6edfb6bcb2053601447dc32d7f32d74c
            SKIP)

pkgver() {
  cd composer
  git describe --tags | tr - .
}

prepare() {
  cd composer

  git apply --3way "$srcdir/cmake.patch"
}

build() {
  mkdir composer/build
  cd composer/build

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd composer/build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
