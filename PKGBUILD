# Maintainer: Cravix < dr dot neemous at gmail dot com >
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=freegish-git
_pkgname=freegish
pkgver=1.60.181.f53d915
pkgrel=1
pkgdesc="Free version of gish, a physics platformer"
arch=('x86_64' 'i686')
url="http://github.com/freegish/freegish"
license=('GPL')
depends=('sdl' 'openal' 'libvorbis' 'libpng' 'libgl')
makedepends=('git' 'cmake')
provides=('freegish')
conflicts=('freegish')
install='freegish.install'

source=("git://github.com/${_pkgname}/${_pkgname}"
        'freegish.desktop'
        'libmath.patch')

md5sums=('SKIP'
         '45a57af69e7e6becdac80ed85d87f871'
         '92f82b888c2f3766af4e17684f84f04e')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo 1.60.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/$_pkgname"

  # libmath fix...
  patch -p1 < ../libmath.patch
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  cd build
  make install DESTDIR="$pkgdir"

  cd "$srcdir/$_pkgname"
  cp -r music "$pkgdir/usr/share/$_pkgname"
}

# vim: sw=2:ts=2 et:
