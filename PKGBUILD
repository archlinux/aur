# Maintainer: Eric Mrak <mail at ericmrak dot info>
# vim:set ts=2 sw=2 et:
pkgname=fry-git
_gitname=fry
pkgver=20140701
pkgrel=2
pkgdesc="A simple ruby version manager for fish"
url="https://github.com/terlar/fry"
arch=('any')
license=('MIT')
depends=('fish')
makedepends=('git')
provides=('fry')
conflicts=('fry')
install=${pkgname}.install
source=("git+https://github.com/terlar/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $_gitname
  mv share/fry share/fish
  make PREFIX="$pkgdir/usr" install
  install -D LICENSE.txt $pkgdir/usr/share/licenses/$_gitname/LICENSE
}
