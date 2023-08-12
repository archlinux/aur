# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Matthias Blankertz <matthias at blankertz dot org>
# Contributor: Egon Geerardyn <egon dot geerardyn at gmail dot com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Gaetan Bisson <bisson at archlinux dot org>
# Contributor: Jared Casper <jaredcasper at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann at t-online dot de>

pkgname=pcb
epoch=1
# switched from YYYYMMDD to I.J.K
pkgver=4.3.0
pkgrel=3
pkgdesc='Interactive printed circuit board editor'
url='http://pcb.geda-project.org/'
license=('GPL')
arch=('x86_64')
depends=('gtkglext' 'gd')
optdepends=('tk: additional tools'
            'tcl: additional tools'
            'perl: additional tools'
	    'desktop-file-utils: desktop integration')
makedepends=('intltool' 'tk')
source=("https://downloads.sourceforge.net/pcb/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ae852f46af84aba7f51d813fb916fc7fcdbeea43f7134f150507024e1743fb5e')

build() {
  cd "$pkgname-$pkgver"
  ./configure \
      --prefix=/usr \
      --enable-dbus \
      --disable-update-mime-database \
      --disable-update-desktop-database
  make
}

package() {
  cd "$pkgname-$pkgver"
  make -j1 prefix="$pkgdir/usr" install

  rm "$pkgdir/usr/share/info/dir"
}
