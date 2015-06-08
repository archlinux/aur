# Contributor: TuxSpirit<tuxspirit@archlinux.fr>
# Contributor: BlueCore  (for Lazarus compilation)
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guipdftk
pkgver=0.33
pkgrel=3
pkgdesc="GUI for PDFTK, lazarus-gtk2 needed"
# You must install lazarus-gtk2 and run it once. This will create some
# files under ~/.lazarus which are needed for compilation. Sorry, better
# solutions are welcome.
arch=('i686' 'x86_64')
license=('GPL')
install=(${pkgname}.install)
url="http://www.paehl.de/pdf/gui_pdftk.html"
makedepends=('lazarus')
optdepends=('pdftk: you want it, but technically you do not need it')
source=(http://www.paehl.de/pdf/downloads/linux_source.zip \
        ${pkgname}.desktop \
		guipdftk.config)
md5sums=('9bdee03b0c1bc9c71468cdae0d5096ee'
         '0d4df8e390030d63e0f3adf2b234ed81'
         '2a4b26260ce1651934b15eaf5a82d57f')
options=('!emptydirs')

build() {
  bsdtar xzvf linux_source.tar.gz
  sed '/TargetProcessor/d' project1.lpi > tmp
  mv tmp project1.lpi
  lazbuild  project1.lpr
}

package() {
  #Program
  install -D -m 755 ${srcdir}/guipdftk ${pkgdir}/usr/bin/guipdftk
  install -D -m 644 ${srcdir}/guipdftk.config ${pkgdir}/usr/bin/guipdftk.config

  #AddOn Desktop
  install -D -m 644 ${srcdir}/${pkgname}.desktop \
	  ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
