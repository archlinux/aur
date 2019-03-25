# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Ray Rashif <schiv@archlinux.org

pkgname=python2-poppler
_realname=pypoppler
pkgver=0.12.1
pkgrel=10
pkgdesc="Python 2.x bindings for Poppler"
arch=('x86_64')
url="https://launchpad.net/poppler-python"
license=('GPL')
depends=('pygtk' 'poppler-glib')
source=("https://launchpad.net/poppler-python/trunk/development/+download/$_realname-$pkgver.tar.gz"
        'pypoppler-0.12.1-poppler-0.16.0.patch'
        'python-poppler-0.12.1-poppler-0.39.0-changes.patch')
md5sums=('1a89e5ed3042afc81bbd4d02e0cf640a'
         '683c5b67866d56adc2494120cc329dc8'
         '5f0a6f7f4b649ad61a71f800a6e0ba91')

prepare() {
  cd $_realname-$pkgver

  # poppler 0.16 compat
  patch -Np0 -i ../pypoppler-0.12.1-poppler-0.16.0.patch

  # poppler 0.18 compat
  sed -i "/pixbuf/,/^)/d" poppler.defs

  # poppler 0.39 compat
  patch -Np0 -i ../python-poppler-0.12.1-poppler-0.39.0-changes.patch
}

build() {
  cd $_realname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              PYTHON=python2
  make
}

package() {
  cd $_realname-$pkgver
  make DESTDIR="$pkgdir" install
}
