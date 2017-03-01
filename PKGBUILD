# Maintainer: TheLugal <thelugal@gmail.com>

pkgname=pybitmessage
_realname=PyBitmessage
pkgver=0.6.2
pkgrel=1
pkgdesc="Decentralized and trustless P2P communications protocol for sending encrypted messages to another person or to many subscribers"
arch=('any')
depends=('openssl' 'python2' 'python2-pyqt4' 'qt4' 'sqlite')
optdepends=('mpg123: MP3 sounds support'
            'alsa-utils: WAV sounds support')
url="https://github.com/Bitmessage/PyBitmessage"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://github.com/Bitmessage/$_realname/archive/v$pkgver.tar.gz
        pybitmessage.sh)
md5sums=('fd54c80e65e472c707a1d463887cdcad'
         '0dfcad65e76e7403ae17ceeb6764d2b8')
sha256sums=('bc209725ef7c1b913ec8560557e3e862a11f664bd8c5fd2eea5adcd915acc2c6'
            'dad3783438c7328468eb0117da04b26c4f6d5f897ed3b44a333b22355c938a4b')
provides=('pybitmessage')
conflicts=('pybitmessage-git')

prepare() {
  cd "$srcdir/$_realname-$pkgver"

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

package() {
  cd "$srcdir/$_realname-$pkgver"

  msg 'Installing shared files...'
  mkdir -p "$pkgdir"/usr/share/$pkgname
  cp -R src/* "$pkgdir"/usr/share/$pkgname

  msg 'Installing desktop icons...'
  install -D -m644 desktop/pybitmessage.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m644 src/images/can-icon-24px.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/$pkgname.png"
  install -D -m644 desktop/can-icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -D -m644 desktop/can-icon.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"

  msg 'Installing executable...'
  install -D -m755 $srcdir/pybitmessage.sh "$pkgdir/usr/bin/$pkgname"

  msg 'Installing man page...'
  mkdir -p "$pkgdir/usr/share/man/man1"
  install -m644 man/pybitmessage.1.gz "$pkgdir/usr/share/man/man1"
}

