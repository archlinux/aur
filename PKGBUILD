# Maintainer: Alexandre Jesus <adbjesus@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_pkgname=luigi
pkgname=python2-${_pkgname}
pkgver=2.6.0
pkgrel=1
pkgdesc="Workflow mgmgt + task scheduling + dependency resolution"
arch=('any')
depends=('python2>=2.7' 'python2-daemon' 'python2-tornado')
makedepends=('python2-setuptools')
optdepends=('python2-mechanize: for debugging Hadoop jobs more easily')
url="https://github.com/spotify/luigi"
license=('Apache')
source=(https://github.com/spotify/luigi/archive/${pkgver}.tar.gz)
md5sums=('49cfff8fc00a1764ec8b8f200846373f')
sha256sums=('f9ea68453b7f0895f8a609cf11cd4dfde8ecbbf464c3234b30ac1e3a3f9c886c')

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
