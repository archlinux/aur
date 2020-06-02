# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=pex
pkgver=2.1.11
pkgrel=1
pkgdesc='A library and tool for generating .pex (Python EXecutable) files'
arch=('any')
url='https://pex.readthedocs.org/'
license=('Apache2')
depends=('python' 'python-wheel')
makedepends=('python-tox')
source=(pex-$pkgver.zip::https://github.com/pantsbuild/pex/archive/v$pkgver.zip)
sha256sums=('05fb1ab7d5850a43b9472a34213f5a673eb75fb06d4cfbae8b009a8a05f9dde3')

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
