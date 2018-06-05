# Maintainer: Sherlock Holo <sherlockya@gmail.com>

pkgname=python-uvloop-systemlibuv
_pkgname=uvloop
pkgver=0.10.1
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
sha256sums=('a4f6614df1b9b7ada9f458e566bc704c32c73f0b8109d31c85d861fc8bd15faa')

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
