# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

pkgname=python-cryptography-fernet-wrapper
pkgver=1.0.3
pkgrel=2
pkgdesc="A wrapper for cryptography.fernet"
arch=(any)
url="https://github.com/KrazyKirby99999/$pkgname"
license=('GPL3')
depends=('python')
depends=('python-cryptography')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "0001-Fix-README-filename-in-setup.py.patch")
sha256sums=('d08cdb05a94af9e0acd21af330b4b51d7d8f4d2a960d2e620076c27b0bf64871'
            'b5ee9a7d994d8071fdcbc0609dcaaa8919a45e61cfec3ddcaf9dfc80207ee721')

prepare() {
	cd "$pkgname-$pkgver"

	patch -p1 < "$srcdir/0001-Fix-README-filename-in-setup.py.patch"
}

build() {
	cd "$pkgname-$pkgver"

	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
