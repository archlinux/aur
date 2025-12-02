pkgname=gosuslugi-plugin
pkgver=1.3.19.0
pkgrel=1
pkgdesc='Crypto Interface Web Browser Plugin for ESIA https://gosuslugi.ru/'
arch=('x86_64')
url="https://www.gosuslugi.ru/landing/gosplugin"
license=('unknown')
depends=('pcsc-tools' 'glibc' 'acsccid' 'xcb-util')
optdepends=('cryptopro-csp-k1: for digital signature sign in' 'rutoken-pkcs: add rutoken pksc#11 device support')
makedepends=('sed' 'tar' 'coreutils' 'unzip' 'libarchive')
provides=('gosplugin')

source_x86_64=("Gosplugin_Linux-Debian_Installer.deb.zip::https://gu-st.ru/content/Gosplugin/Gosplugin_Linux-Debian_Installer.deb.zip")
sha256sums_x86_64=("5cce84af9529ae636a6732393b40f99287f1c1f046b356ab909607156cdadda1")

package() {

  unzip -f Gosplugin_Linux-Debian_Installer.deb.zip
  payload_offset=$(grep --text --line-number '^PAYLOAD:$' Gosplugin_Linux-Debian_Installer.deb.sh  | cut -d: -f1)
  tail -n +$((payload_offset + 1)) Gosplugin_Linux-Debian_Installer.deb.sh | tar -x
  bsdtar -xf gosuslugi-plugin_1.3.19.0-1_amd64.deb
  tar -xf data.tar.gz

  cp -a "${srcdir}/usr" "${pkgdir}"
  cp -a "${srcdir}/opt" "${pkgdir}"
  cp -a "${srcdir}/etc" "${pkgdir}"
  rm -rf "${pkgdir}/usr/lib64"
  cp -a /usr/lib/libxcb-util.so.1.0.0 ${pkgdir}/opt/iitrust/gosuslugi_plugin/lib/libxcb-util.so.0

}

