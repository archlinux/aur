# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=python-seed-isort-config
_pypi_name=${pkgname#python-}
_name=${_pypi_name//-/_}
pkgver=2.2.0
pkgrel=1
pkgdesc="Statically populate the 'known_third_party' 'isort' setting."
arch=('any')
url="https://github.com/asottile/seed-isort-config"
license=('MIT')
depends=(
	'python'
	'python-aspy-refactor-imports'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_pypi_name/$_name-$pkgver.tar.gz")
sha256sums=('be4cfef8f9a3fe8ea1817069c6b624538ac0b429636ec746edeb27e98ed628c8')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
