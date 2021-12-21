# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: garion < garion @ mailoo.org >
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=iscan-data
pkgver=1.39.2.1
pkgrel=1
pkgdesc="EPSON Image Scan! data files"
arch=('any')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('GPL2')
depends=('libxslt')
source=("http://support.epson.net/linux/src/scanner/iscan/${pkgname}_${pkgver%.*}-${pkgver/*.}.tar.gz")
sha256sums=('6a62bc6e84257714785d99316a017b8444207e3dcf56d35d0ce13f292d855824')

build() {
  cd "${pkgname}-${pkgver%.*}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver%.*}"

  # install files
  make DESTDIR="${pkgdir}" install

  # install additional documentation files
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    KNOWN-PROBLEMS NEWS SUPPORTED-DEVICES
}

