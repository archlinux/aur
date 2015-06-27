# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>
# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: Nicolas Martyanoff <khaelin@gmail.com>
# Contributor: Rick Chen <stuffcorpse@archlinux.us>

pkgname=tokyocabinet-git
pkgver=1.4.48.r15.gd303368
pkgrel=1
pkgdesc="a modern implementation of DBM"
arch=('i686' 'x86_64' 'armv7h')
url="http://fallabs.com/tokyocabinet/"
license=('LGPL')
makedepends=('gcc>=3.1' 'make' 'pkgconfig' 'git')
depends=('zlib' 'bzip2')
source=("$pkgname"::'git+git://github.com/Incubaid/tokyocabinet')
conflicts=('tokyocabinet')
provides=('tokyocabinet=1.4.48')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --enable-off64
  make
}

# uncomment check routine if needed (can take ~5mins to run check)
# check() {
#  cd "$srcdir/$pkgname"
#  make -k check
# }

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
