# $Id$
# Maintainer: Biell <biell@pobox.com>

pkgname=xvile
_basename=vile
pkgver=9.8_p
_basever=9.8
pkgrel=1
pkgdesc="vi like emacs"
arch=('i686' 'x86_64')
url="http://invisible-island.net/vile/vile.html"
depends=('perl' 'vile' 'xaw3d')
license=('custom')
options=(!libtool)
source=(
	"ftp://invisible-island.net/vile/vile-${_basever}.tgz"
	"ftp://invisible-island.net/vile/patches/vile-${_basever}a.patch.gz"
	"ftp://invisible-island.net/vile/patches/vile-${_basever}b.patch.gz"
	"ftp://invisible-island.net/vile/patches/vile-${_basever}c.patch.gz"
	"ftp://invisible-island.net/vile/patches/vile-${_basever}d.patch.gz"
	"ftp://invisible-island.net/vile/patches/vile-${_basever}e.patch.gz"
	"ftp://invisible-island.net/vile/patches/vile-${_basever}f.patch.gz"
	"ftp://invisible-island.net/vile/patches/vile-${_basever}g.patch.gz"
	"ftp://invisible-island.net/vile/patches/vile-${_basever}h.patch.gz"
	"ftp://invisible-island.net/vile/patches/vile-${_basever}i.patch.gz"
	"ftp://invisible-island.net/vile/patches/vile-${_basever}j.patch.gz"
	"ftp://invisible-island.net/vile/patches/vile-${_basever}k.patch.gz"
	"ftp://invisible-island.net/vile/patches/vile-${_basever}l.patch.gz"
	"ftp://invisible-island.net/vile/patches/vile-${_basever}m.patch.gz"
	"ftp://invisible-island.net/vile/patches/vile-${_basever}n.patch.gz"
	"ftp://invisible-island.net/vile/patches/vile-${_basever}o.patch.gz"
	"ftp://invisible-island.net/vile/patches/vile-${_basever}p.patch.gz"
)
md5sums=(
	'b5a0d89165f633a662cdb4b5c57f2e2f'
	'685cb681943e9315a1689a6a6f4734cb'
	'f3842ea427c635d0ee96f6da8566fa56'
	'69cfdbb0b84a51802455bbe44a5ce32e'
	'5d675193bc02ac4cab72452bf0051489'
	'1e6317a15d7b2cd99f921f3af312b977'
	'7f8a38272395f07e1377cc1943d37e7f'
	'26ab76a7305b7ec97b22855810911ceb'
	'6ea4cf22e29f5418f26ba6632985c70e'
	'908e8f9cf3c9a681c3ef76a3cd04a0c3'
	'66f4136ab1ce33f491080c0fb3c87b06'
	'e4a60ed7e3959269201c5a937b206272'
	'6dcca45518004247ff9e11a791a054c9'
	'34ea7ba67a31685827c71d88d4be851b'
	'a820b20d9032e3021c1b4fdd5f01492b'
	'55b726a610737bd3203a4478e352b6b9'
	'6b0ad7123f74c6bb58f18fa0cfb50173'
)

prepare() {
  cd $srcdir/${_basename}-${_basever}
  for i in $srcdir/${_basename}-${_basever}?.patch; do
    patch -p1 <$i
  done
  sed -i 's|FLEX_BETA|FLEX_NOBETA|g' filters/filters.h
}

build() {
  cd $srcdir/${_basename}-${_basever}
  ./configure --prefix=/usr --with-x --with-Xaw3d
  make || return 1
}

package() {
  cd $srcdir/${_basename}-${_basever}

  install -D -m 755 xvile $pkgdir/usr/bin/xvile

  sed -e 's/ vile / xvile /' ./macros/vile-pager >$pkgdir/usr/bin/xvile-pager
  chmod 755 $pkgdir/usr/bin/xvile-pager
  install -D -m 644 ./vile.1 $pkgdir/usr/share/man/man1/xvile.1
  install -D -m 755 ./xshell.sh $pkgdir/usr/bin/xshell.sh
  install -D -m 644 ./macros/vilemenu.rc $pkgdir/usr/share/vile/vilemenu.rc

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cat <<EOF >$pkgdir/usr/share/licenses/$pkgname/license
Copyright

Vile is copyrighted by Paul G. Fox, Thomas E. Dickey and Kevin Buettner with some
files (e.g., visvile) copyright by Clark Morgan.
We distribute it under the terms of the GNU Public License, Version 2. 
EOF
}

