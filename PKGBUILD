# Contributor: Arnaud Lier <zeprofdecoding@gmail.com>
# Maintainer: Arnaud Lier <zeprofdecoding@gmail.com>

pkgname=python-ghtopdep
_name=${pkgname#python-}
pkgver=0.3.13
pkgrel=1
pkgdesc='CLI tool for sorting dependents repositories and packages by stars.'
arch=('any')
url='https://github.com/github-tooling/ghtopdep'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=("${pkgname}" 'ghtopdep')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('142aeffc098ce0e167b8112f4950b692ea6ef888a173751433a8a79b837a4cd1c2eef9c323b8be955d21812211949ffbec6a436a3c31da1794462a3aaf33176f')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
        export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

        install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
