# Maintainer: Leonard de Ruijter <alderuijter@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=mididings
pkgver=20120419
pkgrel=1
pkgdesc="A MIDI router and processor based on Python, supporting ALSA and JACK MIDI"
arch=('i686' 'x86_64')
url="http://das.nasophon.de/mididings/"
license=('GPL')
depends=('boost-libs' 'python-decorator' 'jack' 'libsmf')
makedepends=('boost')
optdepends=('python-dbus: to send DBUS messages'
            'python-pyliblo: to send or receive OSC messages'
            'python-pyinotify: to automatically restart when a script changes')
source=("http://das.nasophon.de/download/$pkgname-$pkgver.tar.gz")
md5sums=('5d4b642a1b76817b742f01cda60c0a3f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # build against libboost_python3.so
  sed -i 's/boost_python/&3/' setup.py
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build --enable-smf
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root=$pkgdir

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname/examples"
  install -Dm644 doc/*.* \
    "$pkgdir/usr/share/doc/$pkgname"

  # examples
  install -Dm644 doc/examples/* \
    "$pkgdir/usr/share/doc/$pkgname/examples"
}
