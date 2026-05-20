# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-textual-fspicker"
_pkgname=${pkgname#python-}
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple Textual filesystem picker dialog library"
arch=('any')
url='https://github.com/davep/textual-fspicker'
license=('MIT')
depends=('python' 'python-textual')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-uv-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c9818863c1db42359283f7aa094f6588a48e8a0215d78f89aeb727ac3adc920d')


build() {
	cd "$_pkgname-$pkgver"

	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"

	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
