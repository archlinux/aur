# Maintainer: Davi da Silva Böger <dsboger[at]gmail[dot]com>
pkgname=zimsearch-git
_pkgname=zimsearch
pkgver=r16.a9c1893
pkgrel=1
pkgdesc="GNOME Shell search provider for Zim Desktop Wiki pages"
url="https://github.com/dsboger/zimsearch"
arch=('any')
license=('GPL')
depends=('zim' 'gnome-shell')
makedepends=('git')
conflicts=('zimsearch')
provides=('zimsearch')
source=('git+https://github.com/dsboger/zimsearch')
md5sums=SKIP

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  ./autogen.sh
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname
  make DESTDIR=$pkgdir install
}

