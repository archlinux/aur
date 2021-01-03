# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=pex
pkgver=2.1.24
pkgrel=1
pkgdesc='A library and tool for generating .pex (Python EXecutable) files'
arch=('any')
url='https://pex.readthedocs.org/'
license=('Apache2')
depends=('python' 'python-wheel')
makedepends=('python-tox')
source=(pex-$pkgver.zip::https://github.com/pantsbuild/pex/archive/v$pkgver.zip)
sha256sums=('48f8aec0e6ae76627523fbca3b1eeb9ebe0207c6eab3b3fa22ab283f397efa81')

prepare() {
  cd pex-$pkgver
  sed "s/ = describe_git_rev()/ = '$pkgver'/" -i scripts/package.py
}

build() {
  cd pex-$pkgver
  tox -e package
}

package() {
  cd pex-$pkgver
  install -D -m755 dist/pex $pkgdir/usr/bin/pex
}
