# Contributor: Olivier Mehani <olivier.mehani@inria.fr>
# $Id$

pkgname=linbox-converter-client
pkgver=1.0.3
pkgrel=2
pkgdesc="Linbox (Microsoft Office documents to PDF) Converter commandline client"
url="http://www.linbox.com/converter"
depends=('python' 'tk')
source=(http://adullact.net/frs/download.php/468/linbox-converter-${pkgver}.tar.gz)
md5sums=('ab5f4f96d723cf6e86da82764beb8eaf')
backup=('etc/lbx-converter.conf')
install=('linbox-converter-client.install')

build() {
  cd ${startdir}/src/linbox-converter-${pkgver}/client

  install -m 0755 -d ${startdir}/pkg/etc
  install -m 0644 lbx-converter.conf ${startdir}/mailcap.lbx-converter ${startdir}/pkg/etc
  
  install -m 0755 -d ${startdir}/pkg/usr/bin
  install -m 0755 lbx-converter lbx-view lbx-view-web ${startdir}/pkg/usr/bin

  sed -i "s/^PDFVIEWER=.*/PDFVIEWER=xpdf/g" ${startdir}/pkg/usr/bin/lbx-view
  sed -i "s/netscape/firefox/g" ${startdir}/pkg/usr/bin/lbx-view-web 
}
