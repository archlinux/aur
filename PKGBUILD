# Maintainer: Josef Vybihal <josef dot vybihal at gmail dot com>
# Old Maintainer: Jeff Henson <jeff at henson dot io>
# Old Maintainer: cuihao <cuihao dot leo at gmail dot com>
# Original PKGBUILD (community/gstm):
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gstm
pkgver=1.2
pkgrel=3
pkgdesc="Gnome front-end to ssh tunneling"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gstm/"
license=('GPL')
depends=('libgnomeui')
makedepends=('intltool')
source=(http://downloads.sourceforge.net/sourceforge/gstm/gstm-${pkgver}.tar.gz)
md5sums=('7fa71b86969d8d695c3b062780a5694e')

build() {
   cd ${srcdir}/gstm-${pkgver}
   sed -i "s/gstm_LDADD = /& -lxml2 -lX11 /" src/Makefile.in
   ./configure --prefix=/usr
   make || return 1
}

package() {
   cd ${srcdir}/gstm-${pkgver}
   make DESTDIR=${pkgdir} install
}
