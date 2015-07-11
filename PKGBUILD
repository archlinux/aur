# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: laloch <lalochcz@gmail.com>
pkgname=dsf2flac-svn
pkgver=53
pkgrel=1
pkgdesc="A file conversion tool for translating dsf and dff dsd audio files into flac pcm audio files."
arch=('i686' 'x86_64')
url="https://code.google.com/p/dsf2flac"
license=('GPL3')
depends=('boost-libs' 'flac' 'id3lib')
makedepends=('boost' 'cmake' 'subversion')
source=('dsf2flac::svn+http://dsf2flac.googlecode.com/svn/trunk/')
sha512sums=('SKIP')

pkgver() {
  svnversion dsf2flac
}

prepare() {
  cd dsf2flac
  perl -ne 'print unless /-static/' -i CMakeLists.txt
}

build() {
  rm -fr build
  mkdir build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release "$srcdir"/dsf2flac
  make
}

package() {
  install -Dm755 build/dsf2flac "$pkgdir/usr/bin/dsf2flac"
}

# vim:set ts=2 sw=2 et:
