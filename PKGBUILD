# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=pigar
pkgver=2.0.5
pkgrel=1
pkgdesc="A fantastic tool to generate requirements for your Python project, and more than that"
arch=('any')
url="https://github.com/Damnever/pigar"
license=('BSD')
depends=('jupyter-nbformat' 'python-colorama' 'python-requests' 'python-packaging'
         'python-rich' 'python-tenacity' 'python-cachecontrol' 'python-certifi' 'python-distlib'
         'python-aiohttp' 'python-distro' 'python-click')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/Damnever/pigar/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('339661ce1f5dd1a56ae0c31004337c00952714dd8b7b14752c4068202a7b5f7c1ba14e7921e40da2028e042471d432a9760804e3c919669ca7bafc7d48aae526')

build() {
  cd pigar-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pigar-$pkgver
  python -m unittest discover pigar/tests/ -t . -v
}

package() {
  cd pigar-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
