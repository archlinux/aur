# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=sphinxcontrib-devhelp
pkgname=python38-sphinxcontrib-devhelp
pkgver=1.0.2
pkgrel=9
pkgdesc='Sphinx extension which outputs Devhelp document'
arch=('any')
url=https://github.com/sphinx-doc/sphinxcontrib-devhelp
license=('BSD')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools'
             'python38-wheel')
checkdepends=('python38-pytest' 'python38-sphinx')
source=("https://files.python38hosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ff7f1afa7b9642e7060379360a67e9c41e8f3121f2ce9164266f61b9f4b338e4')
b2sums=('fcf04148bc4a77963517d9011c20a6b77eee499f1a5dcd4a9631b4f415f80a9f7091b254f74ba2fbc9b7106dfb741dc839e14813e088d5a0802793ed457e95df')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python3.8 -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/sphinxcontrib_devhelp-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
