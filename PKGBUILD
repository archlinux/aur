# Maintainer: Alexandre Jesus <adbjesus@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_pkgname=luigi
pkgname=python2-${_pkgname}
pkgver=2.7.2
pkgrel=1
pkgdesc="Workflow mgmgt + task scheduling + dependency resolution"
arch=('any')
depends=('python2>=2.7' 'python2-daemon' 'python2-tornado')
makedepends=('python2-setuptools')
url="https://github.com/spotify/luigi"
license=('Apache')
source=(https://github.com/spotify/luigi/archive/${pkgver}.tar.gz)
md5sums=('4b9dbc1ff98f59f066c562d76d3aeacc')
sha256sums=('ae97b9225f674957661b3b2a8c55c045bf948d705f805b88bbdee64ce39282ec')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1

  for file in ${pkgdir}/usr/bin/*; do
    mv $file ${file}2
  done
}
