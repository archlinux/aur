# Maintainer: Matthew Murray <matt@mattmurr.xyz>
pkgname=python-validity
pkgver=0.5
pkgrel=2
pkgdesc="Validity fingerprint sensor driver"
arch=(any)
license=(MIT)
depends=(python python-pyusb python-cryptography python-dbus python-gobject 
  innoextract open-fprintd fprintd-clients)
makedepends=(python-setuptools)
conflicts=($pkgname)
provides=($pkgname)
url="https://github.com/uunicorn/${pkgname}"
source=("${url}/archive/${pkgver}.tar.gz"
  python-validity.service)
md5sums=('31e74cf48b7a2592eb6b1bcae3c2eb78'
         '41bda3076126b2465eb3cc6dafe14385')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --prefix=/usr --root $pkgdir || return 1
  install -D -m 644 $srcdir/python-validity.service \
    $pkgdir/usr/lib/systemd/system/python-validity.service
}

# vim:set ts=2 sw=2 et:
