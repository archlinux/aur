# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pytest-runner
pkgver=6.0.0
pkgrel=1
pkgdesc="Invoke py.test as distutils command with dependency resolution"
arch=('any')
license=('MIT')
url="https://github.com/pytest-dev/pytest-runner"
depends=('python38-pytest' 'python38-setuptools')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm' 'python38-wheel')
checkdepends=('python38-pytest-virtualenv' 'python38-pytest-enabler')
source=("https://github.com/pytest-dev/pytest-runner/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('8628f4b2ef24a1bcd3294efcfad289cb96949b0b1176e64b2033b8767c5fd217acdf763a3cdb137af6043e0dacd64a76d0a104674dc88464fbb473df37d24c61')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd pytest-runner-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd pytest-runner-$pkgver
  PYTHONPATH="$PWD" pytest
}

package() {
  cd pytest-runner-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
