# Maintainer: Sherlock Holo <sherlockya@gmail.com>

pkgname=python-uvloop-systemlibuv
_pkgname=uvloop
pkgver=0.13.0
pkgrel=1
pkgdesc="A fast, drop-in replacement of the built-in asyncio event loop. Use system libuv."
url="https://github.com/MagicStack/uvloop"
provides=('python-uvloop')
conflicts=('python-uvloop')
license=('MIT' 'APACHE')
arch=('i686' 'x86_64')
depends=('python' 'libuv')
makedepends=('cython' 'python-setuptools')
conflicts=('python-uvloop')
source=("https://github.com/MagicStack/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3159f81a6caa38e97ee03fc2a706c8b8a21fb726e01d0cfcbed1f8de2ce55fd8')

build() {
	cd "$srcdir"/$_pkgname-$pkgver
    rm -rf vendor
	python setup.py build_ext --inplace --use-system-libuv
    python setup.py build_py
}

package() {
	cd "$srcdir"/$_pkgname-$pkgver
	python setup.py install --skip-build --root="$pkgdir/" --optimize=1

    #install -m0644 -D LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-MIT
	#install -m0644 -D LICENSE-APACHE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-APACHE
}
