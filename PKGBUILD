# Maintainer: Damien Guihal <dguihal@gmail.com>
pkgname=vdhcoapp
pkgver=1.0.7
pkgrel=1
pkgdesc="Companion application for Video DownloadHelper browser add-on."
arch=('i686' 'x86_64')
url="https://github.com/mi-g/vdhcoapp"
license=('GPL2')
groups=()
depends=()
source=("firefox-net.downloadhelper.coapp.json"
        "chrome-net.downloadhelper.coapp.json")
source_x86_64=("https://github.com/mi-g/vdhcoapp/releases/download/v${pkgver}/net.downloadhelper.coapp-${pkgver}-1_amd64.tar.gz")
source_i686=("https://github.com/mi-g/vdhcoapp/releases/download/v${pkgver}/net.downloadhelper.coapp-${pkgver}-1_i386.tar.gz")
#generate with 'makepkg -g'
md5sums=('e959d300fbfcf7ff49ce3100a97e18f1'
         '894202d812000cf1498e5a1a77493126')
md5sums_i686=('2dac02fcddd866902761660feffa1e9c')
md5sums_x86_64=('6e49ae2a1dfd2ac28692c0e5ad8ab449')
sha1sums=('f1dcdc8d798d05474ac03ed0b73fc0b971103709'
          '9921d68bde6f84c8f53671f1c8a1d36b4415fc01')
sha1sums_i686=('5dcdd00db1ac1b5f863170b4c39afbb4dbc29989')
sha1sums_x86_64=('69fb6d34f0ee0041db2ede7c3d2e5dc4c1e566b5')

package() {
  # From setup-linux-system.sh

  # Firefox
  mkdir -p ${pkgdir}/usr/lib/mozilla/native-messaging-hosts
  install firefox-net.downloadhelper.coapp.json -m 0755 ${pkgdir}/usr/lib/mozilla/native-messaging-hosts/net.downloadhelper.coapp.json

  # Chrome & Chromium
  mkdir -p  ${pkgdir}/etc/opt/chrome/native-messaging-hosts
  install chrome-net.downloadhelper.coapp.json -m 0644 ${pkgdir}/etc/opt/chrome/native-messaging-hosts/net.downloadhelper.coapp.json
  mkdir -p  ${pkgdir}/etc/chromium/native-messaging-hosts
  install chrome-net.downloadhelper.coapp.json -m 0644 ${pkgdir}/etc/chromium/native-messaging-hosts/net.downloadhelper.coapp.json

  mkdir -p ${pkgdir}/usr/bin

  cd ${srcdir}/net.downloadhelper.coapp-${pkgver}

  if [[ $CARCH == 'i686' ]]; then
    install bin/net.downloadhelper.coapp-linux-32 -m 0755 ${pkgdir}/usr/bin/net.downloadhelper.coapp-linux
  else
    install bin/net.downloadhelper.coapp-linux-64  -m 0755 ${pkgdir}/usr/bin/net.downloadhelper.coapp-linux
  fi

}

# vim:set ts=2 sw=2 et:

