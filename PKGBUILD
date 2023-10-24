# Maintainer: cmuench

# Default language is english
# Languages to choose from: en, de
_LANG='en'

pkgname=ecodms-client
pkgver=23.01
pkgrel=1
pkgdesc="Document Management Software"
arch=('x86_64')
url="http://www.ecodms.de/index.php/de/"
license=('custom')
depends=('apr' 'bash' 'libappindicator-gtk2' 'libgcrypt' 'libpng' 'libjpeg-turbo' 'libtiff5' 'openjpeg2' 'pcre' 'qt5-webengine' 'qt5-svg' 'qt5-x11extras' )
options=('!strip')
install=${pkgname}.install

source_x86_64=("ecodmsclient-23.01-1_amd64.deb::https://www.ecodms.de/ecodms_230164/jammy/ecodmsclient-23.01-1_amd64.deb")
sha256sums_x86_64=("4d797bf11c4615041bb22b57e4a469cd15e125adce6eb5a241f8007f697bdf29")

package() {
  cd "${srcdir}"
  tar -xf data.tar.gz

  ln -sf /usr/lib/libpcre.so opt/ecodms/ecodmsclient/libpcre.so.3
  ln -sf /usr/lib/libappindicator.so opt/ecodms/ecodmsclient/libayatana-appindicator.so.1

  sed -i '1 i #!/bin/sh' opt/ecodms/ecodmsclient/ecodmsclient.sh
  sed -i '1 i #!/bin/sh' opt/ecodms/ecodmsclient/ecodmsconmgr.sh

  # Set client language
  cp -f opt/ecodms/ecodmsclient/language_${_LANG}.qm opt/ecodms/ecodmsclient/language.qm

  cp -dr --no-preserve=ownership etc opt usr "${pkgdir}"/
}
