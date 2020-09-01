# Maintainer: Martin C. Doege <mdoege at compuserve dot com>

pkgname=morinus
pkgver=8.1.0
pkgrel=1
pkgdesc="Astrology software in wxPython"
url="https://sites.google.com/site/pymorinus7/"
license=("GPL3")
install=${pkgname}.install
depends=(wxpython python2-imaging)
arch=(i686 x86_64)
source=("https://sites.google.com/site/pymorinus7/home/Morinus810.zip"
        'morinus-portrait.png'
        'morinus.desktop'
        )
md5sums=('dff0075f797060dd928ad375eabe35ec'
         '4140ef94ff63a7b650e98fedc165945f'
         'd5325556826e5a3bf1cd65c71f645576')

package() {
  cd $srcdir/Morinus810/SWEP/src/
  python2 setup.py build
  cp build/lib.linux-$CARCH-2.7/sweastrology.so $srcdir/Morinus810/
  cd $srcdir/Morinus810/
  rm -r SWEP/src Images Opts
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/Morinus810/morinus.py $pkgdir/usr/bin/morinus
  rm $srcdir/Morinus810/morinus.py
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages/$pkgname
  sed -i 's/import Image/from PIL import Image/g' $srcdir/Morinus810/*.py
  cp -pr $srcdir/Morinus810/* $pkgdir/usr/lib/python2.7/site-packages/$pkgname/
  touch $pkgdir/usr/lib/python2.7/site-packages/morinus/__init__.py
  chmod 755 $pkgdir/usr/bin/morinus
  mkdir -p "$pkgdir/usr/share/"{applications,icons}
  cp "$srcdir/morinus.desktop" "$pkgdir/usr/share/applications"
  cp "$srcdir/morinus-portrait.png" "$pkgdir/usr/share/icons"
  }
