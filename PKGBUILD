# Maintainer: Sauyon Lee <sauyonl@sauyon.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: mexus
pkgname=cldoc
pkgver=1.9
pkgrel=1
pkgdesc='cldoc is a clang based documentation generator for C and C++. cldoc tries to solve the issue of writing C/C++ software documentation with a modern, non-intrusive and robust approach.'
arch=('i686' 'x86_64')
url='http://jessevdk.github.com/cldoc'
license=('GPL2')
depends=('python2' 'python2-pyparsing' 'python2-setuptools')
makedepends=('ruby-sass' 'npm')
options=(!emptydirs)
source=("$pkgname-$pkgver::https://github.com/jessevdk/cldoc/archive/v${pkgver}.tar.gz")
md5sums=('fada948e1ce7cd0aa1fa330a2fdd256d')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	npm install coffee-script@1.9.2 inline-source@4.0.1 --python=python2
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py generate --coffee=node_modules/.bin/coffee
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
