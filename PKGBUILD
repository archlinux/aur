# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-jaraco.context
pkgver=4.1.2
pkgrel=1
pkgdesc="Context managers by jaraco"
url="https://github.com/jaraco/jaraco.context"
license=('MIT')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools-scm' 'python38-build' 'python38-installer' 'python38-wheel')
checkdepends=('python38-pytest')
source=("https://github.com/jaraco/jaraco.context/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('bac276b2c5f3e9b3941c8ba48a87aec044591580c1d3ac9350dcaa79e5a421f56a58d8fffc4e0cb57cdcb63b2afffb33bf1e525f858316b084ff9c4c55df797f')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd jaraco.context-$pkgver
  python3.8 -m build -wn
}

check() {
  cd jaraco.context-$pkgver
  python3.8 -m pytest
}

package() {
  cd jaraco.context-$pkgver
  python3.8 -m installer -d "$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
