# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=python-vondb
_name=${pkgname#python-}
pkgver=3.6.4
pkgrel=1
pkgdesc="VON: vEnhance's Olympiad Navigator"
arch=(any)
url=https://github.com/vEnhance/von
license=(MPL-2.0)
depends=(python python-pyperclip python-yaml)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
optdepends=(
  'fzf: for fuzzy finding'
  'texlive-latex: for LaTeX support'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('7bc02612035342711295aa93e3f2071df0bac5363b387d7cddc95c407f785d7d7a238ecf777d1d585920f25af07dea1b16c687a32584cc51fe8f11e087fd345a')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
