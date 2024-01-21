# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-python-lorem
_name=${pkgname#python-}
pkgver=1.3.0.post1
pkgrel=1
pkgdesc="Pythonic lorem ipsum generator"
arch=('any')
url="https://github.com/JarryShaw/lorem"
license=('BSD 3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6a890b0ae42aea21e90bdd0c2c270843178402b3f2c75a3a454d76db8c597716')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
