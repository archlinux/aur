# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname="lib32-libhal1-bin"
pkgver=0.5.14_8
pkgrel=1
pkgdesc='Hardware Abstraction Layer by freedesktop.org (libhal.so.1, 32-bit)'
arch=('x86_64')
url='https://www.freedesktop.org/wiki/Software/hal/'
license=('AFL-2.1' 'GPL-2.0-or-later')
depends=('glibc')
provides=(
  'lib32-libhal'
  'lib32-libhal1'
  'libhal.so=1'
)
conflicts=(
  'lib32-libhal'
  'lib32-libhal1'
)
options=(!buildflags !makeflags !strip !debug)
source=("https://archive.debian.org/debian/pool/main/h/hal/libhal1_${pkgver//_/-}_i386.deb")
sha256sums=('14b7fd650798ff06bf2d11db9508bf5caae65273b81211c838d2f0ae7d55e31d')

package() {
  bsdtar -xvf data.tar.gz -C "$pkgdir"
  mv "$pkgdir/usr/lib" "$pkgdir/usr/lib32"
  mv "$pkgdir/usr/share/doc/libhal1" "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/doc/$pkgname/"{copyright,AUTHORS}
}
