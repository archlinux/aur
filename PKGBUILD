# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=pixman-git
pkgver=pixman+0.38.4+11+gfd5c0da
pkgrel=1
pkgdesc="The pixel-manipulation library for X and cairo"
arch=(x86_64)
url="https://cgit.freedesktop.org/pixman/"
license=('custom')
provides=(pixman)
conflicts=(pixman)
depends=('glibc')
makedepends=('meson' 'libpng')
source=(git+https://gitlab.freedesktop.org/pixman/pixman.git)
sha1sums=('SKIP')

pkgver() {
    cd pixman
      git describe --tags | sed 's/-/+/g'
    }

build() {
  arch-meson pixman build \
    -D loongson-mmi=disabled \
    -D vmx=disabled \
    -D arm-simd=disabled \
    -D neon=disabled \
    -D iwmmxt=disabled \
    -D mips-dspr2=disabled \
    -D gtk=disabled
  ninja $NINJAFLAGS -C build
}

#check() {
#  meson test -C build
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dt "$pkgdir/usr/share/licenses/pixman" -m644 pixman/COPYING
}

# vim:set et sw=2:
