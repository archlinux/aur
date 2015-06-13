# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=oyepa
pkgver=3.2
pkgrel=1
pkgdesc="A tagging file system emulator."
arch=('any')
url="http://pages.stern.nyu.edu/~marriaga/software/oyepa/"
license=('GPL2')
depends=('python2-pyqt' 'python2-pyinotify')
source=(http://pages.stern.nyu.edu/~marriaga/software/$pkgname/$pkgname-latest.tgz)
md5sums=('099777c8b0601bdaa6ff2e6ab4fcfe8c')

package() {
  cd $pkgname-$pkgver
  
  # Oyepa normally uses install.sh to copy and link files.
  # But it can't split between /usr/bin and /usr/share.
  # So we do it by hand, here.

  # Some .py files have no shebang?
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' *.py

  # Copy everything to /usr/share/oyepa/
  install -d    "$pkgdir/usr/share/$pkgname/icons"
  install *.py  "$pkgdir/usr/share/$pkgname"
  install *.png "$pkgdir/usr/share/$pkgname"
  install *O*   "$pkgdir/usr/share/$pkgname"
  install *E*   "$pkgdir/usr/share/$pkgname"
  install -Dm644 icons/* "$pkgdir/usr/share/$pkgname/icons"
  chmod -x "$pkgdir"/usr/share/$pkgname/{CHANGE.LOG,COPYING,README,TODO}
  # Create symlinks in /usr/bin/
  install -d "$pkgdir/usr/bin"
  ln -s /usr/share/$pkgname/oyepa.py         "/$pkgdir/usr/bin/oyepa"
  ln -s /usr/share/$pkgname/oyepa-filemon.py "/$pkgdir/usr/bin/oyepa-filemon"
  ln -s /usr/share/$pkgname/mp.py            "/$pkgdir/usr/bin/mp.py"
  ln -s /usr/share/$pkgname/ds.py            "/$pkgdir/usr/bin/ds"
  ln -s /usr/share/$pkgname/wnote.py         "/$pkgdir/usr/bin/wnote"

  msg "Create the file ~/.oyepa/dirs with directories to watch.  See /usr/share/oyepa/README for more."
}
