# Maintainer: Cacoro2 <marcos707@gmail.com>
# Contributor: Christopher Wallace <christopher@wallaces.email>
pkgname=(webull-desktop)
pkgver=8.9.0
pkgrel=1
pkgdesc="Invest in stocks, ETFs, and options with Webull Financial, all commission-free, \$0 minimum deposit."
arch=('x86_64')
url="https://webull.com"
options=("!strip")
license=('custom')
depends=('hicolor-icon-theme' 'nss')
source_x86_64=("https://u1sweb.webullfintech.com/us/Webull%20Desktop_8.9.0_80009000_global_x64signed.deb")
sha512sums_x86_64=('4ac2c73f6d3c304629cdc6348246d4e365654966905f4dfd0dfc232ed0b43e9d6ce2a3ba0fb92cfe266bdf2522ea37c4aeb284ad59b2739e40766f62dd883c74') 
package(){
  bsdtar --no-same-owner -xf  data.tar.xz -C "${pkgdir}"
  mv "${pkgdir}"/usr/local/ "${pkgdir}"/opt
  #rm "${pkgdir}"/opt/WebullDesktop/libnssutil3.so
  ln -s /usr/lib/libnssutil3.so "${pkgdir}"/opt/WebullDesktop/libnssutil3.so
  install -Dm644 "${pkgdir}"/opt/WebullDesktop/LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
  install -dm755 "${pkgdir}"/usr/bin
  ln -s /opt/WebullDesktop/WebullDesktop "${pkgdir}"/usr/bin
  sed -i 's|Exec=/usr/local/WebullDesktop/WebullDesktop|Exec=env LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/opt/WebullDesktop /opt/WebullDesktop/WebullDesktop|' "${pkgdir}"/usr/share/applications/WebullDesktop.desktop
  sed -i 's|Name=WebullDesktop   |Name=Webull Desktop|' "${pkgdir}"/usr/share/applications/WebullDesktop.desktop
  sed -i 's|Icon=WebullDesktop.png|Icon=WebullDesktop|' "${pkgdir}"/usr/share/applications/WebullDesktop.desktop
  sed -i 's|Version=6.5.0|Version=1.5|' "${pkgdir}"/usr/share/applications/WebullDesktop.desktop
  sed -i 's|Categories=Utiltity;|Categories=Finance;|' "${pkgdir}"/usr/share/applications/WebullDesktop.desktop
}
