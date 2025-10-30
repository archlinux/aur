# Maintainer: ResRipper <resripper@connective.link>

# shellcheck disable=SC2034,SC2148,SC2154

_name=mkdocs_marimo
pkgname=mkdocs-marimo
pkgver=0.2.1
pkgrel=1
pkgdesc="A plugin to embed interactive marimo notebooks in your MkDocs documentation."
arch=(any)
url='https://marimo-team.github.io/mkdocs-marimo/'
license=('Apache-2.0')
options=(!debug)

depends=(
    'python-htmlmin2>=0.1.13'
    'marimo>=0.8.15'
    'mkdocs>=1.5.2'
    'python-pymdown-extensions>=10.7'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('9e4cf8005b79856beb3e9db48e7c8fa7f94a5d00c05aa6877f44a173c0ec9bb0')

build() {
    cd $_name-$pkgver || exit
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
}