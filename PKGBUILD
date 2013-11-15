# Maintainer: Army
_pkgname=rtspeccy
pkgname=$_pkgname-git
pkgver=20120914.76
pkgrel=1
pkgdesc="Real time spectrum analyzer (audio)"
arch=('i686' 'x86_64')
url="http://www.uninformativ.de/projects/?q=rtspeccy"
license=('GPL3')
depends=('glut' 'alsa-lib' 'fftw' 'mesa')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/vain/rtspeccy.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  # custom config
  if [ -e $SRCDEST/config.h ];then msg "using custom config.h";cp $SRCDEST/config.h .;else cp config.h.example config.h;fi
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" prefix="/usr" install
}

# vim:set ts=2 sw=2 et:
