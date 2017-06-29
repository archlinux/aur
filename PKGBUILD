# Maintainer: Leonard de Ruijter <dev@systeemdenker.nl>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=mididings
pkgver=20120419
pkgrel=2
pkgdesc="A MIDI router and processor based on Python, supporting ALSA and JACK MIDI"
arch=('i686' 'x86_64')
url="http://das.nasophon.de/mididings/"
license=('GPL')
depends=('boost-libs' 'python2-decorator' 'jack' 'libsmf')
makedepends=('boost')
optdepends=('python2-dbus: to send DBUS messages'
            'python2-pyliblo: to send or receive OSC messages'
            'python2-pyinotify: to automatically restart when a script changes')
source=("http://das.nasophon.de/download/$pkgname-$pkgver.tar.gz")
md5sums=('5d4b642a1b76817b742f01cda60c0a3f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build --enable-smf
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root=$pkgdir

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname/examples"
  install -Dm644 doc/*.* \
    "$pkgdir/usr/share/doc/$pkgname"

  # examples
  install -Dm644 doc/examples/* \
    "$pkgdir/usr/share/doc/$pkgname/examples"
}
