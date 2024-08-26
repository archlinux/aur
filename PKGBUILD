# Maintainer: Justin Vreeland <vreeland.justin@gmail.com>
# Maintainer: weilinfox <caiweilin at iscas.ac.cn>

pkgname=debmake
pkgver=4.4.0
pkgrel=4
_pkgrel=4
pkgdesc="Helper script to make the Debian source package"
arch=('any')
url="https://salsa.debian.org/debian/debmake"
license=('LicenseRef-debmake')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('devscripts' 'dpkg' 'python' 'python-debian' 'rsync')
optdepends=('strace' 'wget' 'curl')
source=("$pkgname-$pkgver::git+https://salsa.debian.org/debian/debmake.git#tag=debian/$pkgver-$_pkgrel")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"

	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	cd "$pkgname-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
