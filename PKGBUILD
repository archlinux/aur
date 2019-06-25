# Maintainer : Leonidas Spyropoulos <artafinde at gmail com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Mario J Steele <mario@ruby-im.net>

pkgname=dvdstyler
pkgver=3.1.1
pkgrel=1
pkgdesc="Cross-platform DVD authoring application"
arch=('i686' 'x86_64')
url="http://www.dvdstyler.de/"
license=('GPL')
depends=('cdrkit' 'dvdauthor' 'dvd+rw-tools' 'zip' 'xmlto' 'wxgtk' 'wxsvg>=1.5.19' 'mjpegtools' 'libgnomeui' 'libexif')
makedepends=('docbook-xsl' 'flex')
optdepends=('dvdisaster: ECC support'
	    'xine-ui: DVD preview player'
	    'vlc: DVD preview player'
	    'smplayer: DVD preview player')
source=("http://downloads.sourceforge.net/dvdstyler/${pkgver}/DVDStyler-${pkgver}.tar.bz2")
sha256sums=('b737eeb4bcc35bc0abf2873f90292a09be1827422fedaa72ef7456026e46f49d')

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
