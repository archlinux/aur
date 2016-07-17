# Maintainer: M0Rf30
# This file is part of BlackArch Linux ( http://blackarch.org ).
# See COPYING for license details.
_name=wifiphisher
pkgname=${_name}-git

pkgver=256.3993ac2
pkgrel=1
groups=('blackarch' 'blackarch-wireless' 'blackarch-social')
pkgdesc='Fast automated phishing attacks against WPA networks.'
arch=('any')
url='https://github.com/sophron/wifiphisher'
license=('MIT')
depends=('python2' 'python2-httplib2' 'python2-pyric' 'scapy' 'aircrack-ng')
makedepends=('git')
provides=('wifiphisher')
conflicts=('wifiphisher')
source=("git+https://github.com/sophron/wifiphisher.git")

pkgver() {
  cd "$srcdir/${_name}"

  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/${_name}"
  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${_name}"
  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
  rm -rf $pkgdir/usr/lib/python2.7/site-packages/tests/
}

md5sums=('SKIP')

