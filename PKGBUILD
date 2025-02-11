# Maintainer: Markus Schaaf <markuschaaf@gmail.com>
pkgname=didjvu
pkgver=0.10.2
pkgrel=1
pkgdesc='DjVu encoder with foreground/background separation'
arch=(any)
url='https://github.com/FriedrichFroebel/didjvu'
license=('GPL-2.0-only')
depends=(
	'python>=3.6'
	'gamera>=4'
	'python-pillow'
	'djvulibre>=3.5.22'
	'minidjvu>=0.8'
	'libgexiv2>=0.10.3'
	'python-gobject'
	'python-setuptools'
)
checkdepends=(
	'python-pytest'
)
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	'test_cli-action_names.patch'
)

prepare(){
	for p in *.patch ; do patch -p0 < "$p" ; done
}

check(){
    cd "$pkgname-$pkgver"
    pytest
}

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
    make -C doc
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -m644 -D -t "$pkgdir/usr/share/man/man1" doc/didjvu.1
}

sha256sums=('fc740748ca6bad0f8cf4d12e2247c91f2f3fd978a7ea9025b239523ce01d168b'
            'c7430a90770e3c90b5e4a6b9350476e8e0ce6233e8d861423b6db589323c3ad0')
