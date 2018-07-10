# Maintainer: Sherlock Holo <sherlockya@gmail.com>

pkgname=python-uvloop-systemlibuv
_pkgname=uvloop
pkgver=0.11.0
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
sha256sums=('a8e2db5f9517aa6a2476616d6f3bf9793d5aa84241b44eab608e9c76f05c1f49')

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
