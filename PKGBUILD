# Maintainer: Beej <beej@beej.us>
# Contributor: Evans Jahja <evansjahja13@gmail..com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Timur Antipin < kosmocap (at) gmail.com >

pkgname=joy2key
pkgver=1.6.3
pkgrel=5
pkgdesc='Translate joystick movements into keystrokes'
arch=('x86_64' 'i686')
url='https://github.com/joolswills/joy2key'
license=('GPL-2.0-only')
makedepends=('git')
depends=('libx11' 'xorg-xwininfo')
source=("$pkgname-$pkgver::git+https://github.com/joolswills/joy2key.git"
        'htons-error.patch')
sha256sums=('SKIP'
            '7d45caf7d8b64bc74eb9b3b69c87ffb019408b3d1181dc046f1326208a73009b')

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i ${srcdir}/htons-error.patch
}

build() {
  cd "$pkgname-$pkgver"

  autoreconf --install
  autoconf
  ./configure --prefix=/usr -x-libraries=/usr/lib
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
