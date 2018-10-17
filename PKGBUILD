# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=herrie-git
pkgver=20170505
pkgrel=1
pkgdesc="A minimal music player."
arch=('i686' 'x86_64')
url="http://www.herrie.info"
license=('GPL')
depends=('libmodplug' 'libsndfile' 'libid3tag' 'libxspf' 'libmad' 'curl' 'dbus-glib')
makedepends=('git')
source=("$pkgname::git+https://github.com/EdSchouten/herrie")
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
  cd "$srcdir/$pkgname/${pkgname%-*}"
  # Fix from 'herrie' package
  sed -i -e s/spiff/xspf/g -e s/SPIFF/XSPF/g -e s/Spiff/Xspf/g {configure,src/*.c}
  sed -i s!modplug.h!libmodplug/modplug.h! src/audio_format_modplug.c
}

build() {
  cd "$srcdir/$pkgname/${pkgname%-*}"
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname/${pkgname%-*}"
  make DESTDIR="$pkgdir" install
}

