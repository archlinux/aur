# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=migen
pkgname=python-$_pkgname
pkgver=0.9.2
pkgrel=7
pkgdesc='A Python toolbox for building complex digital hardware'
arch=('any')
url='https://github.com/m-labs/migen'
license=('BSD')
depends=('python-colorama')
makedepends=('python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "https://github.com/m-labs/migen/commit/0fb91737090fe45fd764ea3f71257a4c53c7a4ae.patch")
sha512sums=('9ff39f9f9b7e99b7d933e39091eb7e98c413ec3e60b98722d813df30fe95484470a1a027ac08bdf065bf688f4bb53af2c4618d3bbc0f1086adab33e149dca98f'
            '7fbeccacb93d4ba7b956f6136433b0381cb88ec11b6b4b9601da7b6ac60c552568fddd108b1022e4e0fa771c351018485b1d1b6c00ad872c936bf505a29f1c8f')

prepare() {
  cd $_pkgname-$pkgver
  # fhdl/tracer: update to support python 3.11
  patch -Np1 -i ../0fb91737090fe45fd764ea3f71257a4c53c7a4ae.patch
}

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
