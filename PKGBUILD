# Maintainer:
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>

_module="markdownify"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=1.2.2
pkgrel=1
pkgdesc="Convert HTML to Markdown"
url="https://github.com/matthewwithanm/python-markdownify"
license=('MIT')
arch=('any')

depends=(
  'python'
  'python-beautifulsoup4'
  'python-six'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"https://pypi.io/packages/source/${_module::1}/$_module/$_module-$pkgver.$_pkgext")
sha256sums=('b274f1b5943180b031b699b199cbaeb1e2ac938b75851849a31fd0c3d6603d09')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
