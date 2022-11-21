# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Jose Riha <jose1711 gmail com>

_name=littleutils
pkgname=python38-littleutils
pkgver=0.2.2
pkgrel=4
pkgdesc='Small personal collection of python utility functions'
arch=('any')
url=https://github.com/alexmojaki/littleutils
license=('MIT')
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools'
             'python38-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'littleutils-LICENSE::https://raw.githubusercontent.com/alexmojaki/littleutils/master/LICENSE')
sha256sums=('e6cae3a4203e530d51c9667ed310ffe3b1948f2876e3d69605b3de4b7d96916f'
            'dfe14f8798c400cbcc85bb4536a686c6fcf3086b3446c3f7c7054a2bcd73ca6a')
b2sums=('80aec2c133e39eb0e18c948b15d475e60842689fd0e758c43511a8b014648d7c9e843182e2a87c0b3f9933f748340f2059653f0885cf416edbc5a60457c70629'
        'e44ad793561d875774b4af672b66ee48156279a99d23a4c2d24425b33adf6fa6cc0c2abc6f99302b435da198b3525c4107f56bbed06155162712e1bd9b13e62e')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  python3.8 littleutils/__init__.py
}

package() {
  install -Dm644 littleutils-LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
}
