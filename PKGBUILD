# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=fusesoc
pkgver=2.4.1
pkgrel=2
pkgdesc='Package manager and build abstraction tool for FPGA/ASIC development'
arch=('any')
url='https://github.com/olofk/fusesoc'
license=('BSD-2-Clause')
depends=('python' 'python-edalize' 'python-pyparsing' 'python-yaml' 'python-simplesat' 'python-fastjsonschema')
makedepends=('python-setuptools-scm' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('iverilog: run simulation/testbenchs'
            'svn: opencores provider')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a821b1960ee690a110c2b04e5e013b26ff3739570ef9deb9ff8f2edaf455468bee77bd5027ac437edaa3fdb093f68c22a813eec735159df731501383c3262564')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver

  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
