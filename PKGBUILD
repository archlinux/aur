# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Felix Yan <felixonmars@archlinux.org>

# Based on python-pypandoc in [community]

_name=pypandoc
pkgname=python2-$_name
pkgver=1.5
pkgrel=1
pkgdesc='Thin wrapper for pandoc'
arch=('any')
url="https://github.com/bebraw/$_name"
license=('MIT')
depends=('python2-setuptools' 'pandoc')
makedepends=('python2-setuptools' 'pandoc')
checkdepends=('texlive-core' 'texlive-latexextra' 'pandoc-citeproc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('bc1a18115827ac0868b887fa3c9be46736670de8f095cb49b444e61f66779497db9a08bdac0de30f821a64cd6bad195f1d3a29d0159e6e3ad050a78ca0ecea82')

prepare() {
  # We don't really need pip and wheel at runtime
  sed -i "s/install_requires = .*/install_requires = ['setuptools'],/" $_name-$pkgver/setup.py
}

build() {
  cd $_name-$pkgver

  python2 setup.py build
}

check() {
  cd $_name-$pkgver

  python2 setup.py test
}

package() {
  cd $_name-$pkgver

  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
