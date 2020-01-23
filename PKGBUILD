# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-block_tracing
_name=block_tracing
pkgver=1.0.1
pkgrel=5
pkgdesc="Protect process memory"
arch=('any')
url="https://github.com/rianhunter/block_tracing"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"{,.asc}
        "https://raw.githubusercontent.com/rianhunter/$_name/master/LICENSE")
sha256sums=('9faa009a702a8f2f605ebb78314d5ca2a2a93543d061038a3d3a978c93385e68'
            'SKIP'
            'b6fe6404f46a6a82220d921d7854fa8c20c8ea40ff0d0e24748b46878c5d291f')
validpgpkeys=('584EDA5AAC13B9FBFB13F678A6A5398DACC9C15C') # Rian Hunter <rian@thelig.ht>

build() {
	cd "$_name-$pkgver"
    python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
