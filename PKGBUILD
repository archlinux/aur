# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=reportbug
pkgver=13.2.0
pkgrel=1
pkgdesc="A tool designed to make the reporting of bugs in Debian and derived distributions relatively painless"
arch=('any')
url="https://salsa.debian.org/reportbug-team/reportbug"
license=('HPND')
depends=('python' 'python-debian' 'python-debianbts' 'python-apt' 'python-requests' 'apt')
makedepends=('python-setuptools')
optdepends=('sensible-utils: default editor')
conflicts=('python-reportbug')
provides=('python-reportbug')
source=("https://salsa.debian.org/$pkgname-team/$pkgname/-/archive/$pkgver/$pkgname-${pkgver}.tar.gz"
        "LICENSE" # Extracted from debian/copyright in the source tree
        )
sha256sums=('cffa083f754c385346e0dba1cff23f1d260892d5371d86dadfca03b7a3b72f4f'
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
