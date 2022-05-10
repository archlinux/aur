# Maintainer: Daan van Rossum <d.r.vanrossum_at gmx.de>

pkgname=comet-git
pkgver=2.0.0.r178.gf4ea4c8
pkgrel=1
pkgdesc="A python implementation of the VOEvent Transport Protocol for transient celestial events"
arch=('any')
url="https://github.com/jdswinbank/Comet"
license=('BSD')
makedepends=('git' 'java-environment' 'python-twisted' 'python-lxml')
depends=('bash' 'python')
source=("$pkgname"::"git+https://github.com/jdswinbank/Comet.git")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/$pkgname
	python setup.py build
}

package() {
	cd $srcdir/$pkgname
	python setup.py install --root="$pkgdir/" --skip-build --optimize=1
	install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
