# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=doomretro
pkgver=3.5.8
pkgrel=2
pkgdesc='The classic, refined DOOM source port'
arch=('x86_64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
makedepends=('cmake')
optdepends=('timidity++: for music playback')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz"
        "0001-Fix-compilation-on-GCC-10.patch")
sha512sums=('76127772972f6165fd44e53eb9fd38c14afd3a92d474caa9f941e7f159a26cfb3a19e72b837cbae5767dcb4617e89729558c6e5d65f74970b1fd059123ad4eb7'
            'c2413ad416b1122771566df8c36ce05093ba81756c65a724bab29ec4f8092a6c9b3373034ffdec49cddbee3456dcd2f4405631e5d8b411deb0dd0ab3672a4d48')

prepare() {
  mkdir -p build

  # remove in the next version, this patch is backported from upstream
  cd "$pkgname-$pkgver"
  patch -sp1 < "$srcdir/0001-Fix-compilation-on-GCC-10.patch"
}

build() {
  cd build
  cmake ../"$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
