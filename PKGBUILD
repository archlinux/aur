# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=python-vondb
_name=${pkgname#python-}
pkgver=3.0.1
pkgrel=2
pkgdesc="VON: vEnhance's Olympiad Navigator"
arch=(any)
url=https://github.com/vEnhance/von
license=(MIT)
depends=(python python-pyperclip python-yaml)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
optdepends=(
  'fzf: for fuzzy finding'
  'texlive-latex: for LaTeX support'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
  LICENSE)
sha256sums=('343dabc7a56cc7fb9f7f36f5b344195687129e93d5d9978638250698b03157a6'
  '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
