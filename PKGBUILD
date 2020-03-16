# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Daniel Balieiro <daniel@balieiro.com>

pkgbase=python-telepathy
_realname=telepathy-python
pkgname=('python2-telepathy')
pkgver=0.15.19
pkgrel=8
pkgdesc="Python libraries for use in Telepathy clients and connection managers"
arch=('any')
url="https://telepathy.freedesktop.org/"
license=('LGPL')
depends=('python2-dbus')
makedepends=('libxslt')
source=(https://telepathy.freedesktop.org/releases/$_realname/$_realname-$pkgver.tar.gz{,.asc})
validpgpkeys=('19C969DE3A8B96A15366F87F46CCD4CDC88AC059') # Louis-Francis Ratté-Boulianne
sha256sums=('244c0e1bf4bbd78ae298ea659fe10bf3a73738db550156767cc2477aedf72376'
            'SKIP')

build() {
  cd $_realname-$pkgver
  ./configure --prefix=/usr
  make
}

package_python2-telepathy() {
  cd $_realname-$pkgver
  make DESTDIR="$pkgdir" install
  python2 -m compileall "$pkgdir/usr/lib/python2.7/site-packages/telepathy/"
}
