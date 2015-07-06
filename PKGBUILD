# Maintainer: masutu <masutu dot arch at gmail dot com>
pkgname=vidrop
pkgver=0.6.8
pkgrel=1
pkgdesc="A free video transcoding software written in python, for easy conversion of videos into formats playable on Smarthones, Tablets, MIDs, Portable Media Players, etc."
arch=('any')
url="http://vidrop.learnfree.eu/"
license=('GPL')
depends=(mencoder mplayer pygtk)
source=("http://download.learnfree.eu/vidrop/$pkgname-$pkgver-linux.tar.gz")
md5sums=('2f52d9c24d266745a2e33b14688b44f6')

package() {
  cd $srcdir/

  # python2 fix
  for file in vidrop.py vidrop-simple.py; do
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_;s_python "%s"_python2 "%s"_' $file
  done
  
  install -m 0755 -d $pkgdir/usr/bin
  install -m 0755 -d $pkgdir/usr/share/$pkgname/presets
  install -m 0755 -d $pkgdir/usr/share/locale/bg/LC_MESSAGES
  install -m 0755 *.py $pkgdir/usr/share/$pkgname
  install -m 0644 facebook.png vidrop.glade vidrop-logo.png $pkgdir/usr/share/$pkgname
  install -m 0644 presets/* $pkgdir/usr/share/$pkgname/presets
  install -m 0644 locale/bg/LC_MESSAGES/vidrop.mo $pkgdir/usr/share/locale/bg/LC_MESSAGES
  
  cat >$pkgdir/usr/bin/vidrop <<EOF
#!/bin/bash
cd /usr/share/vidrop/
echo $@
./vidrop.py "$@"
EOF
  chmod 0755 $pkgdir/usr/bin/vidrop

  cat >$pkgdir/usr/bin/vidrop-simple <<EOF
#!/bin/bash
cd /usr/share/vidrop/
./vidrop-simple.py "$@"
EOF
  chmod 0755 $pkgdir/usr/bin/vidrop-simple
}

# vim:set ts=2 sw=2 et:
