# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=sphinxcontrib-applehelp
pkgname=python38-sphinxcontrib-applehelp
pkgver=1.0.2
pkgrel=9
pkgdesc='Sphinx extension which outputs Apple help books'
arch=('any')
url=https://github.com/sphinx-doc/sphinxcontrib-applehelp
license=('BSD')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools'
             'python38-wheel')
checkdepends=('python38-pytest' 'python38-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a072735ec80e7675e3f432fcae8610ecf509c5f1869d17e2eecff44389cdbc58')
b2sums=('9532cb990ed97c6773388a66895a066958187e9100d226e2274c26ba07fc5832e42ba407864b69b002da926a79e71ac2d6315125906156214df3920b585d9f71')

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
  ln -s "$site_packages"/sphinxcontrib_applehelp-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
