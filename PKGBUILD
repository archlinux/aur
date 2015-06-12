# Maintainer: Matthias Blankertz <matthias at blankertz dot org>
# Contributor: Egon Geerardyn <egon dot geerardyn at gmail dot com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Gaetan Bisson <bisson at archlinux dot org>
# Contributor: Jared Casper <jaredcasper at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgname=pcb
pkgver=20140316
pkgrel=1
pkgdesc='Interactive printed circuit board editor'
url='http://pcb.geda-project.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtkglext' 'gd')
optdepends=('tk: additional tools'
            'tcl: additional tools'
            'perl: additional tools'
	    'desktop-file-utils: desktop integration')
makedepends=('intltool' 'tk')
source=("http://downloads.sourceforge.net/pcb/${pkgname}-${pkgver}.tar.gz")
sha1sums=('ec714ff136d1817e500e1a9e654e786883b9501e')
install=pcb.install

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./configure \
      --prefix=/usr \
      --enable-dbus \
      --disable-update-mime-database \
      --disable-update-desktop-database
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make -j1 prefix="${pkgdir}"/usr install

  rm "${pkgdir}"/usr/share/info/dir
}
