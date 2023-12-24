# Maintainer: Eldred Habert <me@eldred.fr>
pkgname=python-click-params
pkgver=0.4.1
pkgrel=2
pkgdesc="A bunch of useful click parameter types"
arch=('any')
url="https://click-params.readthedocs.io/en/stable"
license=(Apache)
groups=()
depends=(python 'python-click>=7.0' 'python-click<9.0' python-validators)
makedepends=(python-build python-installer python-wheel 'python-poetry-core>=1.0.0' python-poetry-plugin-export 'python-platformdirs<5.0' 'python-platformdirs>=3.9.1')
optdepends=()
# v0.4.1 is untagged.
_commit=7bed8d7405bafa542e3c9be58c308f04408f1c99
source=("click_params.tar.gz::https://github.com/click-contrib/click_params/archive/$_commit.tar.gz"
        "build.patch")
#source=("click_params.tar.gz::https://github.com/click-contrib/click_params/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('25848b84c9b4408cad5ac2a91a256f57b6bf6130bef66a289dc21d11f33a76cb'
            '88d3ec9f7d3b1e22088ad8dd3e57f57aa5772e4a17177903e58195868fe44c72')

prepare() {
	cd "click_params-$_commit" # "click_params-$pkgver"
	patch -p1 <../build.patch
}

build() {
	cd "click_params-$_commit" # "click_params-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "click_params-$_commit" # "click_params-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
