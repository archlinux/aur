# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Claudio Kozicky <claudiokozicky at gmail dot com>
# Contributor: Celti <celticmadman at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan dot steffens at gmail dot com>
# Contributor: Eric Belanger <eric at archlinux dot org>
# Contributor: Jan de Groot <jgc at archlinux dot org>

pkgname=lib32-smpeg
pkgver=0.4.5
pkgrel=2
pkgdesc="SDL MPEG Player Library (32-bit)"
arch=('x86_64')
url="http://icculus.org/smpeg/"
license=('LGPL')
depends=('lib32-sdl' 'lib32-gcc-libs')
makedepends=('gcc-multilib' 'lib32-mesa' 'lib32-glu' 'subversion')
optdepends=('lib32-glu: to use glmovie')
source=("${pkgname#lib32-}::svn://svn.icculus.org/smpeg/tags/release_${pkgver//./_}")
sha512sums=('SKIP')

build()
{
  cd "${srcdir}/${pkgname#lib32-}"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export LDFLAGS='-m32'
  export LIBS="-lX11"
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib32  --disable-static
  make
}

package()
{
  cd "${srcdir}/${pkgname#lib32-}"
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/usr/"{bin,include,share}
}
