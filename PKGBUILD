# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=libasyncns-git
pkgver=0.8+3+g68cd5af
pkgrel=1
pkgdesc="A C library for executing name service queries asynchronously"
arch=(x86_64)
url="http://0pointer.de/lennart/projects/libasyncns"
license=(LGPL)
depends=(glibc)
makedepends=('git' 'lynx')
provides=(libasyncns)
conflicts=(libasyncns)
source=("git://git.0pointer.de/libasyncns.git")
md5sums=('SKIP')

pkgver() {
  cd libasyncns
  git describe | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd libasyncns
  NOCONFIGURE=1 ./bootstrap.sh
}

build() {
  cd libasyncns
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd libasyncns
  make DESTDIR="$pkgdir" install
}
