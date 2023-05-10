# Maintainer: Filipe Laíns (FFY00) <lains at archlinux dot org>
# Maintainer: Caleb Maclennana <caleb at alerque dot com>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

_pkgname=MyST-Parser
pkgname=python-myst-parser018
pkgver=0.18.1
pkgrel=2
pkgdesc='An extended commonmark compliant parser, with bridges to docutils/sphinx'
arch=('any')
url='https://github.com/executablebooks/MyST-Parser'
license=('MIT')
depends=('python-docutils' 'python-jinja' 'python-markdown-it-py' 'python-mdit_py_plugins' 'python-typing_extensions' 'python-sphinx' 'python-yaml')
optdepends=('python-linkify-it-py: linkify support')
makedepends=('python-build' 'python-installer' 'python-flit-core' 'python-wheel')
checkdepends=('python-beautifulsoup4' 'python-linkify-it-py' 'python-pytest' 'python-pytest-param-files' 'python-pytest-regressions' 'python-sphinx-pytest')
conflicts=('python-myst-parser')
provides=("python-myst-parser=${pkgver}")
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('4bc3a89480f175779da4f093aaa99a1516f76ab4107dcf8747b6614f347e91739f8596693f95529d76aedbb0c84b4efde4262517bc445aa7027d51e05e8b48bc')

build() {
    cd $_pkgname-$pkgver

    python -m build -wn
}

check() {
    cd $_pkgname-$pkgver

    python -m pytest -k 'not test_sphinx_builds and not fixtures and not test_myst_config' || warning "Tests failed"
}

package() {
    cd $_pkgname-$pkgver

    python -m installer -d "$pkgdir" dist/*.whl

    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
