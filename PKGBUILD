# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=reportbug
pkgver=11.4.1
pkgrel=1
pkgdesc="A tool designed to make the reporting of bugs in Debian and derived distributions relatively painless"
arch=('any')
url="https://salsa.debian.org/reportbug-team/reportbug"
license=('custom')
depends=('python' 'python-debian' 'python-debianbts' 'python-apt' 'apt' 'sensible-utils')
makedepends=('python-setuptools')
conflicts=('python-reportbug')
provides=('python-reportbug')
source=("https://salsa.debian.org/$pkgname-team/$pkgname/-/archive/$pkgver/$pkgname-${pkgver}.tar.gz"
        "LICENSE" # Extracted from debian/copyright in the source tree
        )
sha256sums=('324b998372c4f8ae360571cc5af901ed7303fe7838d80220fa6a59d5383ebfd9'
            '604ec308937cc86922cd5c64baaf0e63ccbc87b8d8d3a6c1c5b0f2e47182b273')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	mkdir -p $pkgdir/usr/share/man/man1 $pkgdir/usr/share/man/man5
	install -m644 -t $pkgdir/usr/share/man/man1/ man/*.1
	install -m644 -t $pkgdir/usr/share/man/man5/ man/*.5
	install -Dm644 conf/reportbug.conf $pkgdir/etc/reportbug.conf
	install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
