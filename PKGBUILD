# Maintainer:  Frederic Bezies <fredbezies at gmail.com>
# Contributor: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: felix <at yandex.com, m.p.isaev>

pkgname=({freedm,freedoom1,freedoom2}-git)
pkgbase=freedoom-git
pkgdesc="Free game data files for Doom gaming engines"
pkgver=0.9.r73.g4d61471
pkgrel=1
epoch=1
arch=('any')
url="http://freedoom.github.io/"
license=('BSD')
makedepends=('git' 'imagemagick' 'deutex-devel' 'python2' 'python2-virtualenv' 'asciidoc')
source=(git+https://github.com/freedoom/freedoom.git)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/freedoom"
  git describe | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/freedoom"
  make
}

package_freedm-git() {
  provides=('freedoom' 'freedm')

  cd "$srcdir/freedoom"
  make DESTDIR="$pkgdir" prefix=/usr install-freedm
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/freedm/COPYING
}

package_freedoom1-git() {
  provides=('freedoom' 'freedoom1')

  cd "$srcdir/freedoom"
  make DESTDIR="$pkgdir" prefix=/usr install-freedoom1
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/freedoom1/COPYING
}

package_freedoom2-git() {
  provides=('freedoom' 'freedoom2')

  cd "$srcdir/freedoom"
  make DESTDIR="$pkgdir" prefix=/usr install-freedoom2
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/freedoom2/COPYING
}
