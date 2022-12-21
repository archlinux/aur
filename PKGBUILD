# Maintainer:  Frederic Bezies <fredbezies at gmail.com>
# Contributor: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: felix <at yandex.com, m.p.isaev>

pkgname=({freedm,freedoom}-git)
pkgbase=freedoom-git
pkgdesc="Free game data files for Doom gaming engines"
pkgver=0.12.0.r325.g394537f2
pkgrel=1
epoch=1
arch=('any')
url="http://freedoom.github.io/"
license=('BSD')
depends=('bash')
makedepends=('asciidoc' 'deutex' 'python' 'python-pillow' 'git')
source=(git+https://github.com/freedoom/freedoom.git)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/freedoom"
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/freedoom"
  make
}

package_freedm-git() {
  provides=('freedoom' 'freedm')

  cd "$srcdir/freedoom"
  make prefix=/usr DESTDIR="$pkgdir" install-freedm
  install -Dm644 $srcdir/freedoom/COPYING.adoc $pkgdir/usr/share/licenses/$pkgname/COPYING
}

package_freedoom-git() {
  provides=('freedoom' 'freedoom1' 'freedoom2')

  cd "$srcdir/freedoom"
  make prefix=/usr DESTDIR="$pkgdir" install-freedoom
  install -Dm644 $srcdir/freedoom/COPYING.adoc $pkgdir/usr/share/licenses/$pkgname/COPYING
}

