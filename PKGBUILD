# Maintainer: Sauyon Lee <sauyonl@sauyon.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>
pkgname=cldoc
pkgver=1.7
pkgrel=1
pkgdesc='cldoc is a clang based documentation generator for C and C++. cldoc tries to solve the issue of writing C/C++ software documentation with a modern, non-intrusive and robust approach.'
arch=('i686' 'x86_64')
url='http://jessevdk.github.com/cldoc'
license=('GPL2')
depends=('python2' 'python2-pyparsing')
makedepends=('ruby-sass' 'npm')
options=(!emptydirs)
source=("$pkgname-$pkgver::https://github.com/jessevdk/cldoc/archive/v${pkgver}.tar.gz")
md5sums=('78742b82c2d0f4c68c886a8346c70f52')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	npm install coffee-script inliner --python=python2
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py generate \
		--coffee=node_modules/.bin/coffee \
		--inliner=node_modules/.bin/inliner
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
