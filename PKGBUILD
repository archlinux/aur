# Maintainer: Tiago Peralta <tperalta82@gmail.com>

_pkgname=poetry-plugin-shell
pkgname=python-poetry-plugin-shell
pkgver=1.0.1
pkgrel=1
pkgdesc="This package is a plugin that runs a subshell with virtual environment activated. This plugin replaces the same feature as the shell command previously available in Poetry."
url="https://github.com/python-poetry/poetry-plugin-shell"
license=('MIT')
arch=('any')
depends=('python-poetry')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-mock' 'python-pytest-xdist')
source=("https://github.com/python-poetry/poetry-plugin-shell/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('3f48556b0f5a887eac0a3efe43f778cb956be8a17085d16250743147cd434b9f32af2b0052197796c010f67b7b8b6e51f4c72fe0415add94c23e8c80d6c65a19')

build() {
  cd poetry-plugin-shell-$pkgver
  python -m build -wn
}

check() {
  cd poetry-plugin-shell-$pkgver
  python -m installer -d tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd poetry-plugin-shell-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
