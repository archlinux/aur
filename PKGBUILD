# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: XaBz <xabz.2k5@gmail.com>

pkgname=oblogout
pkgver=0.2
pkgrel=19
pkgdesc='Openbox logout script'
arch=('any')
url='https://launchpad.net/oblogout'
license=('GPL2')
depends=('pygtk' 'python2-pillow' 'python2-dbus')
makedepends=('python2-distutils-extra')
backup=('etc/oblogout.conf')
source=("https://launchpad.net/oblogout/$pkgver/$pkgver.0/+download/$pkgname-$pkgver.tar.bz2"
        'oblogout.patch'
        "$pkgname.conf"
        'ru.po')
sha256sums=('f80003b85e9f4f1c588675453ea03f40a86fc50546d509ceb69706eb045782a9'
            'cea52a14df0ef924fcdd63b2e82c14b94cc2a7753994c176621ace9502bd9109'
            '4a88dbe52d0fbb6563b689e22fde3face5934e25a4c4652d98b971025ca4ed2b'
            'aa8504055ec1e0661c3588cde85aad3267ffa7a42414c106e6ce8bff71f9d883')

prepare() {
  cd "$pkgname"

  patch -p0 -i ../oblogout.patch
  sed -i 's/fromstring/frombytes/' oblogout/__init__.py # FS#46587
  sed -i '0,/on/s//on2/' "$pkgname"/*.py
  cp "$srcdir/ru.po" po
}

package() {
  cd "$pkgname"

  python2 setup.py install --root="$pkgdir"
  install -m644 "$srcdir/oblogout.conf" "$pkgdir/etc/"
}

# vim:set ts=2 sw=2 et:
