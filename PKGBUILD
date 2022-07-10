# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=iserterm-git
pkgver=20201224
pkgrel=2
pkgdesc="Serial terminal for embedded software developers."
arch=('i686' 'x86_64' 'aarch64')
url="http://github.com/ivanovp/iserterm"
license=('GPL')
depends=('qt5-base' 'qt5-serialport')
makedepends=('make' 'git')
_gitroot=git+https://github.com/ivanovp/iserterm.git
_gitname=iserterm
source=("$_gitname::$_gitroot" "iserterm.png" "iserterm.desktop")


pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  cd "$srcdir"
  cd "$_gitname"
  qmake
  make clean
  make
}

package() {
# install -m755 -d $pkgdir/etc/udev/rules.d
  install -m755 -d $pkgdir/usr/{bin,share/applications,share/pixmaps}

  cd $srcdir
  
  install -D -m644 iserterm.desktop $pkgdir/usr/share/applications
  install -D -m644 iserterm.png $pkgdir/usr/share/pixmaps

  install -D -m755 iserterm/iserterm $pkgdir/usr/bin
}

md5sums=('SKIP'
        '0a345f9f723fd03b9eb3bd6cb4c2884f'
        '805214e0042a71e8adf00254d8804a27')

# vim:set sts=2 ts=2 sw=2 et:
