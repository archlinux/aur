# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=typing_inspect
pkgname=python38-$_pkgname
pkgver=0.8.0
pkgrel=1
pkgdesc='Runtime inspection utilities for Python typing module'
arch=('any')
url='https://github.com/ilevkivskyi/typing_inspect'
license=('MIT')
depends=('python38-mypy_extensions' 'python38-typing_extensions')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        $pkgname-support-py39-generic-types.patch::https://github.com/thatch/typing_inspect/commit/67b455cf5a7e.patch)
sha512sums=('c053ae91d332d814c0cb7ca88f88dc2bda29b455b5571d4208943968f7d56a1872f29d002cb9ea9ca6a3b4560255ec14d9f6753e0b623a2f981ad5539d6d3a69'
            '74800c6934fcac7198fda7a68237369452d83a7d8cb194015d114a966572faceef5d2aa511a0a37f2d95c3065e615d9de691f604d7d500570a96c7a18190c46d')

build() {
  cd $_pkgname-$pkgver

  python3.8 setup.py build
}

check() {
  cd $_pkgname-$pkgver

  python3.8 setup.py pytest
}

package() {
  cd $_pkgname-$pkgver

  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
