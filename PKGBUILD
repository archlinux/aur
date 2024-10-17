# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-click-extra
_name=${pkgname#python-}
pkgver=4.11.0
pkgrel=1
pkgdesc='Extra colorization and configuration loading for Click.'
url='https://kdeldycke.github.io/click-extra/'
makedepends=(python-build python-installer python-wheel python-poetry-core python-sphinx-furo)
depends=(python python-boltons python-click 'python-cloup>=3.0.5' python-commentjson python-mergedeep python-yaml python-regex python-requests python-tabulate python-tomli 'python-xmltodict<0.14' python-wcmatch)
checkdepends=(python-pytest python-pytest-cov python-pytest-httpserver python-pytest-randomly python-pytest-cases)
license=('GPL2')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3ade3743c7ee8eea6b46a849bbb708f914ec0a76807c9afeeed4a8c92298fa39f4d41219a8e5aa5acbe8c6657ebc0586346c91ec0d71222311223de8307298c4')

build() {
    cd "$srcdir/$_name-$pkgver"
    GIT_DIR="$srcdir/$_name-$pkgver" python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" license
}
