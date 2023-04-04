# Maintainer: Christopher Arndt <aur at chrisarndt dot de>

_pkgname=lupa
pkgname=python-$_pkgname-luajit
pkgver=2.0
pkgrel=1
pkgdesc='Python wrapper around LuaJIT'
url='https://github.com/scoder/lupa'
license=(MIT)
arch=(x86_64)
depends=(python luajit)
makedepends=(cython python-build python-installer python-setuptools python-wheel)
provides=(python-lupa)
conflicts=(python-lupa)
source=("https://github.com/scoder/lupa/releases/download/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('ad3fef486be7adddd349fe9a9c393789061312cf98ebc533b489be34f484cb79')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.rst CHANGES.rst -t "$pkgdir"/usr/share/docs/$pkgname
  install -Dm 644 logo/*.png -t "$pkgdir"/usr/share/docs/$pkgname/logo
  install -Dm 644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
