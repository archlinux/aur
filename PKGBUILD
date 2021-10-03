# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>

pkgname=python-retry
pkgver=0.9.3
pkgrel=1
_commit=c3f386aa279b130b37a4a4e91e758c7f02ec898c
pkgdesc="Easy to use retry decorator"
arch=('any')
url="https://github.com/invl/retry"
license=('Apache')
depends=('python')
optdepends=('python-decorator: preserves function signatures')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        '001-setup.py.patch')
sha256sums=('855a6bb05942ff94eb5f0240ff7ad2aef7db5bd0749c352d1dcbc9f5c0c8675e'
            '77d9b4b8ab54fa5bdee78bf39ad765db0a04fe71aad76e5773e62505bb27f2f9')

prepare() {
	patch -p1 -d "retry-$_commit" < 001-setup.py.patch
}

build() {
	cd "retry-$_commit"
	python setup.py build
}

check() {
	cd "retry-$_commit"
	python setup.py pytest
}

package() {
	cd "retry-$_commit"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
