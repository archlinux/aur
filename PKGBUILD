# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_name=asttokens
pkgname=python38-asttokens
pkgver=2.1.0
pkgrel=1
pkgdesc='Get the currently executing AST node of a frame, and other information'
arch=('any')
url=https://github.com/gristlabs/asttokens
license=('Apache')
depends=('python38-six')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm'
             'python38-wheel')
#checkdepends=('python38-astroid' 'python38-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4aa76401a151c8cc572d906aad7aea2a841780834a19d780f4321c0fe1b54635')
b2sums=('8b5eb309eddff6e41bfaaa4395d7a693f83de3271d76b9e08cd9e309c5b3780ce084890285e5e4b604f08bb4aea816d672dad38cfc3085afb521a0751eceb632')

build() {
  cd "$_name-$pkgver"
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

#check() {
#  cd "$_name-$pkgver"
#  python3.8 -m venv --system-site-packages test-env
#  test-env/bin/python -m installer dist/*.whl
#  test-env/bin/python -m pytest
#}

package() {
  cd "$_name-$pkgver"
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python3.8 -m "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
