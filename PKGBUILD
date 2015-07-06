# Contributor: OK100 <ok100.ok100.ok100@gmail.com>
# Contributor: aksr <aksr at t-com dot me>
pkgname=vitunes-git
pkgver=2.3.r164.gfa9ff4c
pkgrel=1
epoch=
pkgdesc="A curses-based playlist manager and media player with vim-like keybindings."
arch=('i686' 'x86_64')
url="http://vitunes.org"
url="https://github.com/ryanflannery/vitunes"
license=('custom')
groups=()
depends=('ncurses' 'mplayer' 'taglib')
makedepends=('git')
optdepends=('gstreamer0.10: gstreamer backend')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/ryanflannery/vitunes.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  unset CFLAGS CXXFLAGS LDFLAGS
  ./configure.sh
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm555 vitunes $pkgdir/usr/bin/vitunes
  mkdir -p $pkgdir/usr/share/man/man1
  install -Dm444 doc/vitunes*.1 $pkgdir/usr/share/man/man1
}

