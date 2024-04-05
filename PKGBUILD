# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-click-extra
_name=${pkgname#python-}
pkgver=4.7.4
pkgrel=1
pkgdesc='Extra colorization and configuration loading for Click.'
url='https://kdeldycke.github.io/click-extra/'
makedepends=(python-build python-installer python-wheel python-poetry-core python-sphinx-furo)
depends=(python python-boltons python-click python-click-log python-cli_helpers 'python-cloup>=3.0.1' python-commentjson python-graphviz python-mergedeep python-pygments python-pygments-ansi-color python-yaml python-regex python-requests python-tabulate python-tomli 'python-xmltodict<0.14' python-wcmatch)
checkdepends=(python-pytest python-pytest-cov python-pytest-httpserver python-pytest-randomly python-pytest-cases mypy python-pytest-mypy)
license=('GPL2')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d2d38321fb0df75443084cb80e24a03e090457ab1e5533ffec633b6c23fe3e7f8e30015f6d7223bc465dd428da23a56d1fa5e050b6c50d0c17b0b9a876625898')

build() {
    cd "$srcdir/$_name-$pkgver"
    GIT_DIR="$srcdir/$_name-$pkgver" python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" license
}
