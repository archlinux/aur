# Contributor: Alexander Fehr <pizzapunk gmail com>
# Previous Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Previous Maintainer: Mario J Steele <mario@ruby-im.net>
# Maintainer: Miguel Revilla <yo@miguelrevilla.com>

pkgname=dvdstyler
pkgver=2.9.2
pkgrel=2
pkgdesc="Cross-platform DVD authoring application"
arch=('i686' 'x86_64')
url="http://www.dvdstyler.de/"
license=('GPL')
depends=('cdrkit' 'dvdauthor' 'dvd+rw-tools' 'zip' 'xmlto' 'wxgtk' 'wxsvg>=1.5.4' 'mjpegtools' 'libgnomeui' 'libexif')
makedepends=('docbook-xsl' 'flex')
optdepends=('dvdisaster: ECC support'
	    'xine-ui: DVD preview player'
	    'vlc: DVD preview player'
	    'smplayer: DVD preview player')
options=('!makeflags')
source=(http://downloads.sourceforge.net/dvdstyler/${pkgver}/DVDStyler-${pkgver}.tar.bz2)
sha1sums=('b4cf2296ecadec23931f2b8879f8256f7a35d168')

build() {
  cd "${srcdir}/DVDStyler-${pkgver}"

  ./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config
  make
}

package() {
  cd "${srcdir}/DVDStyler-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -m 644 -D ${pkgdir}/usr/share/doc/dvdstyler/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
