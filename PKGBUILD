# Maintainer: aksr <aksr at t-com dot me>
pkgname=tokenizer-git
pkgver=r113.8b0c4e2
pkgrel=1
pkgdesc='Convert source code into numerical tokens'
arch=('i686' 'x86_64')
url='https://github.com/dspinellis/tokenizer'
license=('Apache')
makedepends=('git')
#optdepends=('cppunit: to test package')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname/src"
	make
}

#check() {
#	cd "$srcdir/$pkgname/src"
#	make test # needs cppunit
#}

package() {
	cd "$srcdir/$pkgname/src"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
	install -D -m644 ../README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 ../LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
