# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-aiopath
_name=${pkgname#python-}
pkgver=0.6.10
pkgrel=2
pkgdesc="Asynchronous pathlib for Python"
arch=('any')
url="https://github.com/alexdelorenzo/aiopath"
license=('LGPL3')
depends=('python-aiofile' 'python-anyio' 'python-typing-extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
#source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6ca97a864fe32478d53af6c40e1951de64ab01d6b402d88524ce72d80362eb7a')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Remove duplicate LGPL3 license
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm "${pkgdir}${site_packages}/$_name-$pkgver.dist-info/LICENSE"
}
