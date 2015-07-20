# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-hpgl
pkgver=0.1.0
pkgrel=1
pkgdesc="Python HPGL Parsing Library"
arch=('any')
url="https://github.com/alexforencich/python-hpgl"
license=('MIT')
depends=('python')

source=("python-hpgl-$pkgver.tar.gz::https://github.com/alexforencich/python-hpgl/archive/v$pkgver.tar.gz")
md5sums=('36b34e1ebd3ab3211ed8d625725a09c4')

build() {
  cd "$srcdir/python-hpgl-$pkgver"
  sed -i "s/'hpgl2svg/'python-hpgl2svg/" setup.py
  sed -i "s/'hprtl2bmp/'python-hprtl2bmp/" setup.py
}

package() {
  cd "$srcdir/python-hpgl-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  cd "$pkgdir/usr/bin"
  ln -s python-hpgl2svg hpgl2svg
  ln -s python-hprtl2bmp hprtl2bmp
}

