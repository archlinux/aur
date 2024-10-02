# Maintainer: Cacoro2 <marcos707@gmail.com>
# Contributor: Christopher Wallace <christopher@wallaces.email>
pkgname=(webull-desktop)
pkgver=8.2.0
pkgrel=1
pkgdesc="Invest in stocks, ETFs, and options with Webull Financial, all commission-free, \$0 minimum deposit."
arch=('x86_64')
url="https://webull.com"
options=("!strip")
license=('custom')
depends=('hicolor-icon-theme' 'nss')
source_x86_64=("https://u1sweb.webullfintech.com/us/Webull%20Desktop_8.2.0_800200_global_x64signed.deb")
sha512sums_x86_64=('3200c65fdf16d52cab8fe396c4b5d9e526f52fc05e69429e375ecc5ea7a87f22e4a77b57b6be25cf7ac1b72e1c7a1a4cf204fef96577106a4d3b11531ca8875f')

package(){
  bsdtar --no-same-owner -xf  data.tar.xz -C "${pkgdir}"
  mv "${pkgdir}"/usr/local/ "${pkgdir}"/opt
  #rm "${pkgdir}"/opt/WebullDesktop/libnssutil3.so
  ln -s /usr/lib/libnssutil3.so "${pkgdir}"/opt/WebullDesktop/libnssutil3.so
  install -Dm644 "${pkgdir}"/opt/WebullDesktop/LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
  install -dm755 "${pkgdir}"/usr/bin
  ln -s /opt/WebullDesktop/WebullDesktop "${pkgdir}"/usr/bin
  sed -i 's|Exec=/usr/local/WebullDesktop/WebullDesktop|Exec=env LD_LIBRARY_PATH=\\$LD_LIBRARY_PATH:/opt/WebullDesktop /opt/WebullDesktop/WebullDesktop|' "${pkgdir}"/usr/share/applications/WebullDesktop.desktop
  sed -i 's|Name=WebullDesktop   |Name=Webull Desktop|' "${pkgdir}"/usr/share/applications/WebullDesktop.desktop
  sed -i 's|Icon=WebullDesktop.png|Icon=WebullDesktop|' "${pkgdir}"/usr/share/applications/WebullDesktop.desktop
  sed -i 's|Version=6.5.0|Version=1.5|' "${pkgdir}"/usr/share/applications/WebullDesktop.desktop
  sed -i 's|Categories=Utiltity;|Categories=Finance;|' "${pkgdir}"/usr/share/applications/WebullDesktop.desktop
}
