# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-zipp
pkgver=3.10.0
pkgrel=1
pkgdesc="Pathlib-compatible object wrapper for zip files"
url="https://github.com/jaraco/zipp"
license=('MIT')
arch=('any')
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm' 'python38-toml' 'python38-wheel')
checkdepends=('python38-jaraco.itertools' 'python38-func-timeout' 'python38-more-itertools')
source=("https://github.com/jaraco/zipp/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ca0103742051648531b2df57545018f779b166fb25117254ea4826ec5364b1fb501fab68aa56d5ffe86df563116027a68858e87a9eacb9b67fb50ad51cbf1066')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd zipp-$pkgver
  python3.8 -m build -nw
}

check() {
  cd zipp-$pkgver
  python3.8 -m unittest discover
}

package() {
  cd zipp-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
