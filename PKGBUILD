# Maintainer: cmuench

# Default language is english
# Languages to choose from: en, de
_LANG='en'

pkgname=ecodms-client
pkgver=21.12.1
pkgrel=2
pkgdesc="Document Management Software"
arch=('x86_64')
url="http://www.ecodms.de/index.php/de/"
license=('custom')
depends=('apr' 'bash' 'libappindicator-gtk2' 'libgcrypt' 'qt5-webengine' 'qt5-svg' 'qt5-x11extras' 'libpng12' 'libjpeg6-turbo' 'pcre' 'freeimage' 'libayatana-appindicator')
options=('!strip')
install=${pkgname}.install

source_x86_64=("ecodmsclient-${pkgver}_amd64.deb::http://www.ecodms.de/ecodms_211264/focal/./ecodmsclient-21.12-1_amd64.deb")
md5sums_x86_64=('129cf00400c05daed173da2622006d96')

package() {
  cd "${srcdir}"
  tar -xf data.tar.gz

  ln -sf /usr/lib/libpcre.so opt/ecodms/ecodmsclient/libpcre.so.3

  sed -i '1 i #!/bin/sh' opt/ecodms/ecodmsclient/ecodmsclient.sh
  sed -i '1 i #!/bin/sh' opt/ecodms/ecodmsclient/ecodmsconmgr.sh

  # Set client language
  cp -f opt/ecodms/ecodmsclient/language_${_LANG}.qm opt/ecodms/ecodmsclient/language.qm

  cp -dr --no-preserve=ownership etc opt usr "${pkgdir}"/
}

