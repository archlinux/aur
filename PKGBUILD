# Maintainer: Alex Talker <alextalker at yandex dot ru>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=4pane
pkgver=5.0
pkgrel=1
pkgdesc="A multi-pane, detailed-list file manager."
arch=('i686' 'x86_64')
url="http://www.4pane.co.uk/index.html"
license=('GPL3')
depends=('wxgtk')
source=(http://downloads.sourceforge.net/project/fourpane/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('399fd056498c31527b1d1466741a1a79')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr --disable-symlink
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install || return 2

  install -d -m755 ${pkgdir}/usr/share/applications
  cd "${pkgdir}/usr/share/applications"
  ln -s ../4Pane/rc/4Pane.desktop 4Pane.desktop
}
