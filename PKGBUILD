# $Id$
# Maintainer: Biell <biell@pobox.com>

pkgname=xvile
_basename=vile
pkgver=9.8_zb
_basever=${pkgver//_/}
pkgrel=1
pkgdesc="vi like emacs"
arch=('i686' 'x86_64')
url="http://invisible-island.net/vile/vile.html"
depends=('vile' 'xaw3d')
license=('custom')
options=(!debug)
source=( https://invisible-island.net/archives/vile/current/vile-${_basever}.tgz )
sha256sums=( d6239e6b728fa9d0b49f526d8f0998d2db4b7a7dfc317273dbff7aea2a09ea31 )

build() {
  cd $srcdir/${_basename}-${_basever}
  ./configure --prefix=/usr --disable-filters --with-x --with-Xaw3d
	#--enable-freetype
  make || return 1
}

package() {
  cd $srcdir/${_basename}-${_basever}

  sed -e 's/ vile / xvile /' macros/vile-pager > macros/xvile-pager

  install -D -m 755 xvile ${pkgdir}/usr/bin/xvile
  install -D -m 755 macros/xvile-pager ${pkgdir}/usr/bin/xvile-pager
  install -D -m 644 vile.1 ${pkgdir}/usr/share/man/man1/xvile.1
  install -D -m 755 xshell.sh ${pkgdir}/usr/bin/xshell.sh
  install -D -m 644 macros/vilemenu.rc ${pkgdir}/usr/share/vile/vilemenu.rc
  install -D -m 644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

