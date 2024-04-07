# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=fusesoc
pkgver=2.3
pkgrel=2
pkgdesc='Package manager and build abstraction tool for FPGA/ASIC development'
arch=('any')
url='https://github.com/olofk/fusesoc'
license=('BSD')
depends=('python' 'python-edalize' 'python-pyparsing' 'python-yaml' 'python-simplesat' 'python-fastjsonschema')
makedepends=('python-setuptools-scm')
optdepends=('iverilog: run simulation/testbenchs'
            'svn: opencores provider')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('958dd104857a5aa638d919b1389b339726471c5119f8dcf371fe2dd51b8c8fc9b76323c5fa2245b9d04913ddae41180760cfa500635aa519189efb3a97928ec1')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver

  python setup.py build
}

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
