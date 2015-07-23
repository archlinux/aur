# Maintainer: Felix Yan <felixonmars@gmail.com>
pkgname=ruijieclient-git
pkgver=20111205
pkgrel=1
pkgdesc="A Ruijie Network Supplicant For GNU/Linux - Git Version"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ruijieclient/"
license=('LGPL3')
depends=('libpcap' 'libxml2')
makedepends=('git')
provides=('ruijieclient')
conflicts=('ruijieclient')
source=()
md5sums=()

_gitroot=('git://github.com/microcai/ruijieclient.git')
_gitname=('ruijieclient')

build() {
  cd "$srcdir"
  msg "Connecting to github.com git server..."
  [ ! -d "$srcdir/$_gitname-build" ] || rm -rf "$srcdir/$_gitname-build"
  
  if [[ -d $_gitname ]]; then
   cd $_gitname || return 1
   git pull origin || return 1
    else
   git clone $_gitroot $_gitname || return 1
     fi
  msg " checkout done."

  msg "Starting make..."

  cd "$srcdir"
  #rm -r "$srcdir/$_gitname-build"
  cp -r $srcdir/$_gitname $_gitname-build
  cd $_gitname-build

  ./autogen.sh || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1  
}

# vim:set ts=2 sw=2 et:

