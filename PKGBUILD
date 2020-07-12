# Maintainer: Matthew Murray <matt@mattmurr.xyz>
pkgname=python-validity
pkgver=r101.1c98a45
pkgrel=1
pkgdesc="Validity fingerprint sensor driver"
arch=(any)
license=(MIT)
depends=(python python-pyusb python-cryptography python-dbus python-gobject 
  innoextract open-fprintd fprintd-clients)
makedepends=(python-setuptools)
conflicts=($pkgname)
provides=($pkgname)
url="https://github.com/uunicorn/${pkgname}"
source=("git+${url}.git#branch=master"
  python-validity.service)
md5sums=('SKIP'
         '41bda3076126b2465eb3cc6dafe14385')

pkgver() {
  cd $srcdir/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$pkgname
  python setup.py build
}

package() {
  cd $srcdir/$pkgname
  python setup.py install --prefix=/usr --root $pkgdir || return 1
}

# vim:set ts=2 sw=2 et:
