# Contributor: Alexander Rødseth <rodseth@gmail.com>
pkgname=loopcenter
pkgver=0.1.2
pkgrel=1
pkgdesc="Record and play back loops"
arch=('i686' 'x86_64')
url="http://loopcenter.sourceforge.net/"
depends=('jack' 'fltk')
license=('GPL')
md5sums=('909c0493d2f204f8a77b7f66270d5d20')
source=('http://sourceforge.net/projects/loopcenter/files/loopcenter/0.1.2/loopcenter-0.1.2.tar.gz/download')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg "Adding includes to RtAudio.cpp"
  cp src/RtAudio.cpp src/RtAudio.cpp.backup
  echo "#include <cstdio>" > src/RtAudio.cpp
  echo "#include <cstring>" >> src/RtAudio.cpp
  echo "#include <cstdlib>" >> src/RtAudio.cpp
  cat src/RtAudio.cpp.backup >> src/RtAudio.cpp
  rm src/RtAudio.cpp.backup

  msg "Adding includes to Looper.cpp"
  cp src/Looper.cpp src/Looper.cpp.backup
  echo "#include <cstdlib>" > src/Looper.cpp
  cat src/Looper.cpp.backup >> src/Looper.cpp
  rm src/Looper.cpp.backup

  msg "Building"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
