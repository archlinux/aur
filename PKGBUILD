# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-ticktick-py
_reponame=ticktick-py
pkgver=2.0.3
pkgrel=2
pkgdesc="Unofficial API library for interacting with TickTick.com"
url="https://pypi.org/project/${_reponame}/"
arch=(any)
license=('MIT')
depends=('python' 'python-requests' 'python-pytz')
makedepends=('python-setuptools' 'cython' 'git')
source=(
	"https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz"
	"password-login.patch::https://github.com/btw04/ticktick-py/commit/2d8d874e2d97f6c43d4fe318665fbe4a7e18eb72.patch"
)
sha256sums=(
	'f6e96870b91f16717a81e20ffef4a2f5b2a524d6a79e31ab64e895a90a372b51'
	'SKIP'
)

prepare() {
	cd "$srcdir/${_reponame}-$pkgver"
	patch -p1 < "$srcdir/password-login.patch"
}

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
