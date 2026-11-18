# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=python-vondb
_name=${pkgname#python-}
pkgver=3.8.0
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
b2sums=('7d3dfbaa97a3d681c7c3781b1acab452bfa77cbe5df81042aafac5939b83bfc507e87d666cb1fd4ff1771f939b4cba89da5635f7a515df06ad403ad7814b91b1')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
