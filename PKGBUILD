# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini AT gmail DOT com>
pkgname=rich-cli
_name=rich-cli
pkgver=1.8.1
pkgrel=1
pkgdesc="Rich-cli is a command line toolbox for fancy output in the terminal "
arch=('any')
url="https://github.com/Textualize/rich-cli"
license=('MIT')

depends=('python-textual' 'python-rich' 'python-click' 'python-requests' 'python-textual' 'python-rich-rst')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry-core')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('fdc485358275a58b47c700a5456d85242aab8f141b8764ff49deed03e7c04723')

prepare() {
	cd "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
