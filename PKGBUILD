# Maintainer : Yunhui Fu <yhfudev@gmail.com>
# Contributor: Christophe Gueret <christophe.gueret@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: Ryan Corder <ryanc@greengrey.org>
# Contributor: M Rawash <mrawash@gmail.com>

pkgname=hippo-canvas
pkgver=0.3.1
pkgrel=2
pkgdesc="The Hippo Canvas is a Cairo/GObject/GTK+ based canvas."
arch=(i686 x86_64)
license=('GPL')
url="http://live.gnome.org/HippoCanvas"
depends=('librsvg>=2.16' 'libcroco>=0.6.0' 'gtk2>=2.6.0')
makedepends=('pygtk')
optdepends=('pygtk: Python Bindings')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.3/${pkgname}-${pkgver}.tar.bz2)
md5sums=('dc19b95faef7daceb3c827d490bff8c3')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  PYTHON=python2 CFLAGS="${CFLAGS} $(pkg-config --cflags --libs gmodule-2.0)" ./configure --prefix=/usr --enable-python || return 1
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install || return 1
}

