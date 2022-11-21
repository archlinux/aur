# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Ismael Carnales <icarnales at gmail dot com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python38-pycodestyle
pkgver=2.9.1
pkgrel=2
pkgdesc="Python style guide checker"
arch=('any')
url="https://pycodestyle.pycqa.org"
license=('custom:Expat')
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools'
             'python38-wheel')
source=("https://github.com/PyCQA/pycodestyle/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('420248fa90b67a625acc7cca0bde4e8a0f69e0de9e2798ddd3b3c6ee8c9917b0c8c970dde2f01881ac446354d75131a84bbe7c207754190343f6df5d3b125ab7')

build() {
  cd pycodestyle-$pkgver
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd pycodestyle-$pkgver
  python3.8 -m unittest discover
}

package() {
  cd pycodestyle-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python3.8 -m "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/pycodestyle-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
