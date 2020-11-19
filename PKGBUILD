# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-ioflo
pkgver=2.0.2
pkgrel=3
pkgdesc='Flo based programming interface in python'
arch=('any')
url='https://ioflo.com'
license=('Apache')
depends=('python')
makedepends=('python-setuptools-git')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ioflo/ioflo/archive/v$pkgver.tar.gz")
sha512sums=('7485924ce329889afb1c3e0555b54fdbfb11eafce48fb0ac15bacd229fea512c44fcc118bbc4368ebc7c770d62129ee6b895b982f73a269de7131ea37daac02b')

prepare() {
  cd ioflo-$pkgver
  sed -i "s/encoding='utf-8',//" ioflo/aio/http/httping.py
  sed -i "s/encoding='utf-8'/'utf-8'/" ioflo/aio/http/clienting.py
}

build() {
  cd ioflo-$pkgver
  python setup.py build
}

check() {
  cd ioflo-$pkgver
  python setup.py pytest
}

package() {
  cd ioflo-$pkgver
  python setup.py install --root="$pkgdir" -O1
}
