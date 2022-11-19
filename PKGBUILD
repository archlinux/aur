# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Caleb Maclennana <caleb@alerque.com>

_pkgname=MyST-Parser
pkgname=python38-myst-parser
pkgver=0.18.1
pkgrel=1
pkgdesc='An extended commonmark compliant parser, with bridges to docutils/sphinx'
arch=('any')
url='https://github.com/executablebooks/MyST-Parser'
license=('MIT')
depends=('python38-docutils' 'python38-jinja' 'python38-markdown-it-py' 'python38-mdit_py_plugins' 'python38-typing_extensions' 'python38-sphinx' 'python38-yaml')
optdepends=('python38-linkify-it-py: linkify support')
makedepends=('python38-build' 'python38-installer' 'python38-flit-core' 'python38-wheel')
checkdepends=('python38-beautifulsoup4' 'python38-linkify-it-py' 'python38-pytest' 'python38-pytest-param-files' 'python38-pytest-regressions' 'python38-sphinx-pytest')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('4bc3a89480f175779da4f093aaa99a1516f76ab4107dcf8747b6614f347e91739f8596693f95529d76aedbb0c84b4efde4262517bc445aa7027d51e05e8b48bc')

build() {
  cd $_pkgname-$pkgver

  python3.8 -m build -wn
}

check() {
  cd $_pkgname-$pkgver

  python3.8 -m pytest -k 'not test_sphinx_builds and not fixtures and not test_myst_config'
}

package() {
  cd $_pkgname-$pkgver

  python3.8 -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
