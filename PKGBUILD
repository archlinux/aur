# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python38-prettytable
pkgver=3.5.0
pkgrel=1
pkgdesc="A simple Python library for easily displaying tabular data"
url="https://github.com/jazzband/prettytable"
arch=('any')
license=('BSD')
depends=('python38-wcwidth')
makedepends=('python38-build' 'python38-installer' 'python38-hatchling' 'python38-hatch-vcs')
checkdepends=('python38-pytest-lazy-fixture')
conflicts=('python38-ptable')
source=("https://github.com/jazzband/prettytable/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('24ef28a42365568bf68a974afd42fcc1bfb9208e1cb75fc1b2890bc2253487afa6536e778b58e320e952ca8bf9b69193bd1293bb7615628d03765ee24c44edff')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd prettytable-$pkgver
  python3.8 -m build -nw
}

check() {
  cd prettytable-$pkgver
  python3.8 -m installer --destdir="$PWD/tmp_install" dist/*.whl
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages" pytest
}

package() {
  cd prettytable-$pkgver
  python3.8 -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
}
