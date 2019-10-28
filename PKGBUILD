# Maintainer: Joseph R Quinn <quinn period joseph r at protonmail dot com>
pkgname=zshdb-git
pkgver=1.1.0
pkgrel=1
pkgdesc='A debugger for zsh scripts.'
arch=('i686' 'x86_64')
url='https://github.com/rocky/zshdb'
license=('GPL')
depends=('zsh')
makedepends=('git')
provides=('zshdb')
source=('git+git://github.com/rocky/zshdb.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname%-git}
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR=$pkgdir install
}