# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=gnome-catgen
pkgname=$_pkgname-git
pkgver=20150411.r57.1ab320c
pkgrel=1
pkgdesc='A Gnome 3.12 and 3.14 application-overview folder configuration tool'
url='https://github.com/prurigro/gnome-catgen'
license=('MIT')
arch=('any')
depends=('dconf')
makedepends=('git')
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
