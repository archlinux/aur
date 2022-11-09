# Maintainer: Christopher Arndt <aur at chrisarndt dot de>

_pkgname=lupa
pkgname=python-$_pkgname-luajit
pkgver=1.14
pkgrel=1
pkgdesc='Python wrapper around LuaJIT'
url='https://github.com/scoder/lupa'
license=(MIT)
arch=(x86_64)
depends=(python luajit)
makedepends=(cython python-setuptools)
provides=(python-lupa)
conflicts=(python-lupa)
source=("https://github.com/scoder/lupa/releases/download/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('59deaa9c50693c99da821263f7e84f709b9c8426dce8e01c2af11d0eaab1f49d')

build() {
  cd $_pkgname-$pkgver
  python setup.py build --with-cython
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.rst CHANGES.rst -t "$pkgdir"/usr/share/docs/$pkgname
  install -Dm 644 logo/*.png -t "$pkgdir"/usr/share/docs/$pkgname/logo
  install -Dm 644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
