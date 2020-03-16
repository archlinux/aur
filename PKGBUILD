# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=python2-pyxmpp
pkgver=1.1.2
pkgrel=7
pkgdesc='Python XMPP and Jabber implementation based on libxml2'
arch=('any')
url='https://github.com/Jajcus/pyxmpp'
license=('LGPL')
depends=('python2-dnspython' 'libxml2' 'python2-m2crypto')
makedepends=('git')
source=("git://github.com/Jajcus/pyxmpp.git#tag=pyxmpp-$pkgver")
md5sums=('SKIP')

prepare() {
  cd pyxmpp

  # Make sure Python 2 is used everywhere
  for pyf in Makefile tests/*.py utils/*.py examples/*.py; do
    sed 's/python/python2/g' -i "$pyf"
  done
  sed 's/env python/env python2/g' -i configure.py
  sed 's/python setup/python2 setup/g' -i configure.py
}

build() {
  cd pyxmpp
  ./configure.py

  # This is my life now
  make || make
}

package() {
  make -C pyxmpp DESTDIR="$pkgdir" install \
    || make -C pyxmpp DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
