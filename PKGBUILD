# Maintainer: Kyle <kyle@gmx.ca>
pkgname=opus-tools-git
_gitname=opus-tools
pkgver=0.1.9.9.gaa7e018 # determined from git origin
pkgrel=1
pkgdesc="A collection of tools for working with opus files (git version)"
arch=(i686 x86_64)
url="http://wiki.xiph.org/Opus-tools"
license=('BSD')
depends=(opus libogg)
makedepends=('git')
provides=(opus-tools)
conflicts=(opus-tools)
source=('git+https://git.xiph.org/opus-tools.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed -e 's|v||' -e 's|-|.|g'
}

build() {
  cd $_gitname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
