# $Id: PKGBUILD 207393 2017-01-14 18:17:11Z seblu $
# Maintainer: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Essien Ita Essien <me@essienitaessien.com>
# Contributor: Peter Baldwin <bald_pete@hotmail.com>

pkgname=httperf
pkgver=0.9.0
pkgrel=8
pkgdesc='A tool for measuring web server performance.'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://code.google.com/p/httperf'
depends=('openssl')
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz"
        'use-SSLv23_client_method.patch')
md5sums=('2968c36b9ecf3d98fc1f2c1c9c0d9341'
         '4b7cd4bd707c322f73333e34f0302b76')

prepare() {
  cd $pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      msg2 "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
