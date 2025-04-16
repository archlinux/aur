# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Gerard Ribugent <ribugent at gmail dot com>
pkgname=python-git-sim
_name=git_sim
pkgver=0.3.5
pkgrel=2
pkgdesc="Visually simulate Git operations in your own repos."
arch=('any')
url='https://initialcommit.com/tools/git-sim'
license=('MIT')
depends=(
  'manim'
  'python>=3.7'
  'python-gitpython'
  'python-opencv'
  'python-pydantic-settings'
  'python-typer'

# should be deps of manim
python-av python-beautifulsoup4
)
makedepends=(python-build python-installer python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('931ad724e8a3085416693227fe2b7b98d9295d6ef3959c072eaadcecab5ce79d93698f8030265d2527d43ab6432cf6583e6c946f8cad6c9329546cb8110cc9ca')


build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
