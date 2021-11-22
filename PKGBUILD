pkgname=rtlsdr-scanner-py3
_pkgname=rtlsdr-scanner
pkgver=1014.07d377b
pkgrel=1
pkgdesc="Python frequency scanning GUI for the OsmoSDR rtl-sdr library"
arch=('any')
license=('GPL3')
depends=('rtl-sdr' 'python' 'python-pyrtlsdr-git' 'wxpython' 'python-pyserial'
         'python-pillow' 'python-numpy' 'python-matplotlib')
makedepends=('git' 'python-setuptools')
optdepends=('python-visvis: better and faster real-time plotting')
url="https://github.com/EarToEarOak/RTLSDR-Scanner"
license=('GPL3')
source=("$pkgname::git+$url#commit=07d377b037696a75a74b057b58b78a32c6050d48")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $pkgname
  find . -name '*.py' -exec sed -i -e "s|#! /usr/bin/env python|#!/usr/bin/env python2|" {} +
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --skip-build

  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.md
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
