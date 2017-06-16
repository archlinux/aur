# Maintainer: Daan van Rossum <d.r.vanrossum_at gmx.de>

pkgname=comet-git
pkgver=r424.8a2444f
pkgrel=1
pkgdesc="A python implementation of the VOEvent Transport Protocol for transient celestial events"
arch=('any')
url="https://github.com/jdswinbank/Comet"
license=('BSD')
makedepends=('java-environment')
depends=('python2' 'python2-twisted' 'python2-lxml' 'python2-ipaddress')
source=("$pkgname"::"git://github.com/jdswinbank/Comet.git"
	'ipnetwork.patch')
sha1sums=('SKIP'
          '7a91f1dd873562d1aa4b5fd68a18cf6dd91bea48')

pkgver() {
	cd $srcdir/$pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/$pkgname
	patch -p1 < $srcdir/ipnetwork.patch
}

build() {
	cd $srcdir/$pkgname
	python2 setup.py build
}

package() {
	cd $srcdir/$pkgname
	python2 setup.py install --root="$pkgdir/" --skip-build --optimize=1
}
