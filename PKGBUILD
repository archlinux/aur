# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Troy C < rstrox -ta yahoo -tod com >

pkgname=python38-wrapt
pkgver=1.14.1
pkgrel=1
pkgdesc="A Python module for decorators, wrappers and monkey patching"
arch=("x86_64")
url="https://pypi.python.org/pypi/wrapt"
license=("BSD")
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
source=("https://github.com/GrahamDumpleton/wrapt/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c67e99eb29afeefb2512fb545cd180b8e96f69235d6281edebe62ea5e411188a904a7e683afdda2d6a86cf8b7fd74f79a3c3bec04e19a7c5ef347729bb43f94c')

build() {
  cd wrapt-$pkgver
  python3.8 setup.py build
}

check() {
  cd wrapt-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.10:$PYTHONPATH" py.test
}

package() {
  cd wrapt-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
