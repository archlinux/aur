# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=sysexxer-git
pkgver=r6.949437a
pkgrel=1
pkgdesc="A tool to send and receive MIDI SysEx data"
arch=('i686' 'x86_64')
# original website by author Christoph Eckert (now dead)
#url="http://www.christeck.de/wp/products/simple-sysexxer/"
# original 0.3 version (Qt4) on SourceForge
#url="https://sourceforge.net/projects/sysexxer/"
# Qt5 port with some minor changes by Manuel-K
url="https://github.com/Manuel-K/SimpleSysexxer"
license=('GPL')
depends=('qt5-base')
provides=('sysexxer')
conflicts=('sysexxer')
source=("$pkgname::git+https://github.com/Manuel-K/SimpleSysexxer")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  qmake-qt5 SimpleSysexxer.pro
  make
}

package() {
  cd "$pkgname"
  make INSTALL_ROOT="$pkgdir/" install
  mv "$pkgdir/usr/local/bin" "$pkgdir/usr"
  rm -Rf "$pkgdir/usr/local"
}

# vim:set ts=2 sw=2 et:
