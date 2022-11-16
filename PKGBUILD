# Maintainer: Christopher Arndt <aur at chrisarndt dot de>

_pkgname=lupa
pkgname=python-$_pkgname-luajit
pkgver=1.14.1
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
sha256sums=('d0fd4e60ad149fe25c90530e2a0e032a42a6f0455f29ca0edb8170d6ec751c6e')

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
