# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>

pkgname=xorg-grandr-git
pkgver=0.1.5.g2aa67e3
epoch=1
pkgrel=1
pkgdesc="Provides a friendly interface to monitor configuration and includes controls for video mode, rotation and monitor position."
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/xorg/app/grandr"
license=('MIT')
depends=("gtk2" "gconf" "libx11")
conflicts=('xorg-grandr')
provides=('xorg-grandr')
makedepends=('git')
source=('git://anongit.freedesktop.org/git/xorg/app/grandr.git'
        'xlib_dep.patch')
md5sums=('SKIP'
         '0a272a3f108a1c646838178610ef998b')
_gitname="grandr"

pkgver() {
  cd $_gitname
  git describe --always | sed 's|^[^0-9]*||;s|-|.|g'
}

build() {
  cd "$srcdir/$_gitname"

  patch -p0 -i "$srcdir/xlib_dep.patch"
  autoreconf -fiv
# ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 

# vim:set ts=2 sw=2 et:
