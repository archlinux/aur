# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=python-pyshorteners
pkgver=1.0.1
pkgrel=1
pkgdesc="Generating short urls with python has never been easier."
arch=('any')
url="https://github.com/ellisonleao/pyshorteners"
license=('GPL-3.0-or-later')
depends=(python)
makedepends=(python-build python-installer python-pytest-runner python-setuptools python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('53d81860970e28e2ac63c6b400317b1c688cd055b3a358ccb7dd23c0c408ff5d61e2d4481f9541018c5047d1f302836a28128d4371005f8e04eb6a111d8f6445')

# https://wiki.archlinux.org/title/Python_package_guidelines
build() {
  cd pyshorteners-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd pyshorteners-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
