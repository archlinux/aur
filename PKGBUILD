# Maintainer: Stefan Gehr <stefangehr@protonmail.com>

pkgname=python-pexpect-git
pkgver=r1628.aa98959
pkgrel=2
pkgdesc='For controlling and automating applications'
arch=(any)
url='https://pexpect.readthedocs.org/en/stable/'
license=(MIT)
depends=(python python-ptyprocess)
makedepends=(git python-build python-installer python-wheel python-setuptools)
conflicts=(python-pexpect)
source=("$pkgname"::"git+https://github.com/pexpect/pexpect")
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
