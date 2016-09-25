# Maintainer: Dominic Meiser dosm dot mail at gmail dot com
# based on protobuf package in extra

# NOTE: this package conflicts with extra/protobuf and is indended for
#       use with aur/protobuf3 to provide the old library to programs
#       compiled with protobuf2

# $Id: PKGBUILD 255600 2015-12-10 05:03:54Z foutrelis $
# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname='libprotobuf2'
pkgver=2.6.1
pkgrel=1
pkgdesc="Protocol Buffers Library 2 - provides protobuf2 library for protobuf3 installations"
arch=('i686' 'x86_64')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=('gcc-libs' 'zlib')
makedepends=('python2-setuptools')
source=(https://github.com/google/protobuf/releases/download/v$pkgver/protobuf-$pkgver.tar.bz2)
md5sums=('11aaac2d704eef8efd1867a807865d85')

build() {
  cd protobuf-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  make -C protobuf-$pkgver check
}

package() {
  cd protobuf-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  install -Dm644 editors/protobuf-mode.el \
    "$pkgdir"/usr/share/emacs/site-lisp/protobuf-mode.el
  
  # remove conflicting files with protobuf3
  cd "$pkgdir"
  rm -rf usr/bin usr/include usr/lib/pkgconfig usr/share
  rm -rf usr/lib/*.so
}
