# Maintainer: Eric Mrak <mail at ericmrak dot info>
# vim:set ts=2 sw=2 et:
pkgname=fry-git
_gitname=fry
pkgver=20160527
pkgrel=1
pkgdesc="A simple ruby version manager for fish"
url="https://github.com/terlar/fry"
arch=('any')
license=('MIT')
depends=('fish')
makedepends=('git')
provides=('fry')
conflicts=('fry')
source=("git+https://github.com/terlar/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $_gitname
  mkdir -p "${pkgdir}/usr/share/fish/vendor_conf.d" \
           "${pkgdir}/usr/share/fish/vendor_completions.d" \
           "${pkgdir}/usr/share/fish/vendor_functions.d"
  make PREFIX="$pkgdir/usr" install
  install -D LICENSE.txt $pkgdir/usr/share/licenses/$_gitname/LICENSE
}
