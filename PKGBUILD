# Maintainer: Fantix King <fantix.king@gmail.com>
# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
pkgname=python-immutables
pkgver=0.21
pkgrel=2
epoch=
pkgdesc="A high-performance immutable mapping type for Python"
arch=(x86_64)
url="https://github.com/MagicStack/immutables"
license=('0BSD AND Apache-2.0')
groups=()
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b55ffaf0449790242feb4c56ab799ea7af92801a0a43f9e2f4f8af2ab24dfc4a')
noextract=()
validpgpkeys=()

prepare() {
	cd "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver"
	PYTHONPATH=$(ls -d build/lib*) IMMU_SKIP_MYPY_TESTS=1 python tests/__init__.py -v
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	mkdir -p $pkgdir/usr/share/licenses/${pkgname}/
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/
	install -Dm644 LICENSE-APACHE $pkgdir/usr/share/licenses/${pkgname}/
}
