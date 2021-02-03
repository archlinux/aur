# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=pex
pkgver=2.1.28
pkgrel=1
pkgdesc='A library and tool for generating .pex (Python EXecutable) files'
arch=('any')
url='https://pex.readthedocs.org/'
license=('Apache2')
depends=('python' 'python-wheel')
makedepends=('python-tox')
source=(pex-$pkgver.zip::https://github.com/pantsbuild/pex/archive/v$pkgver.zip)
sha256sums=('889e95c3114bc6befa0258182d2118b238cacb0abb46a64f3fb7c6313ad08be2')

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
