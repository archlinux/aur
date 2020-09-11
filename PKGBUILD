# Maintainer: Kevin Andriessens <kevin@kelaun.be>
pkgname=python-slpp-git
pkgver=r46.b947496
pkgrel=2
pkgdesc="Simple lua-python data structures parser"
arch=('x86_64')
url="https://github.com/SirAnthony/slpp"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
source=(git+https://github.com/SirAnthony/slpp)
md5sums=(SKIP)

pkgver() {
	cd "slpp"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/slpp"
	python setup.py build	
}

package() {
	cd "${srcdir}/slpp"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
