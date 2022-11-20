# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pygaljs
pkgver=1.0.2
_pygaljscommit=28cef7c290896fcbac8d9e269778d75d9f0a6453
pkgrel=1
pkgdesc="Python package providing assets from https://github.com/Kozea/pygal.js"
url="https://github.com/ionelmc/python-pygaljs"
license=('LGPL')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
source=("https://github.com/ionelmc/python-pygaljs/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/Kozea/pygal.js/archive/$_pygaljscommit/pygal.js-$_pygaljscommit.tar.gz")
sha512sums=('627979740a93232b06526aedc0e12189ce05b85f49c5a334c5d4625ff5b5f3998e78cc7ed123f41cfc11b8e258e67e85b0c0657a5b2c3debddadfc1bb476df59'
            '537954dda2b720d063443b4a34014f84bbe35bf4fefc52c1230d70d34ac4dc27067a6d3b9fbf43871b608932835a853f62b4d7b30daeca8c7dbc8e19d7ded345')

prepare() {
  cd python-pygaljs-$pkgver
  rmdir src/pygaljs/static
  ln -sf "$srcdir"/pygal.js-$_pygaljscommit src/pygaljs/static
}

build() {
  cd python-pygaljs-$pkgver
  python3.8 setup.py build
}

check() {
  cd python-pygaljs-$pkgver
  pytest
}

package() {
  cd python-pygaljs-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
