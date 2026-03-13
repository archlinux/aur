# Maintainer: Cacoro2 <marcos707@gmail.com>
# Contributor: Christopher Wallace <christopher@wallaces.email>
pkgname=(webull-desktop)
pkgver=9.3.0
pkgrel=1
pkgdesc="Invest in stocks, ETFs, and options with Webull Financial, all commission-free, $0 minimum deposit."
arch=('x86_64')
url="https://webull.com"
options=("!strip")
license=('custom')
depends=('hicolor-icon-theme' 'nss' 'libcurl-gnutls' 'qtav')
source_x86_64=("https://u1sweb.webullfintech.com/us/Webull%20Desktop_9.3.0_9100000072_global_x64signed_ffutrq3xq6f5.deb")
sha512sums_x86_64=('bf9421577e55e9de097486c33e429a23f54978e129154d90d3729a29cd204a795d123757e18f58a3dc6cfa2c150831d9edf892ae07cd56c8cecad407018347cd')
package(){
  bsdtar --no-same-owner -xf  data.tar.xz -C "${pkgdir}"
  mv "${pkgdir}"/usr/local/ "${pkgdir}"/opt
  ln -s /usr/lib/libnssutil3.so "${pkgdir}"/opt/WebullDesktop/libnssutil3.so
  install -dm755 "${pkgdir}"/usr/bin
  ln -s /opt/WebullDesktop/WebullDesktop "${pkgdir}"/usr/bin
  sed -i 's|Exec=/usr/local/WebullDesktop/WebullDesktop|Exec=env LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/opt/WebullDesktop /opt/WebullDesktop/WebullDesktop|' "${pkgdir}"/usr/share/applications/WebullDesktop.desktop
  sed -i 's|Name=WebullDesktop   |Name=Webull Desktop|' "${pkgdir}"/usr/share/applications/WebullDesktop.desktop
  sed -i 's|Icon=WebullDesktop.png|Icon=WebullDesktop|' "${pkgdir}"/usr/share/applications/WebullDesktop.desktop
  sed -i 's|Version=6.5.0|Version=1.5|' "${pkgdir}"/usr/share/applications/WebullDesktop.desktop
  sed -i 's|Categories=Utiltity;|Categories=Finance;|' "${pkgdir}"/usr/share/applications/WebullDesktop.desktop
  rm -f "${pkgdir}"/opt/WebullDesktop/libgnutls.so*
  rm -f "${pkgdir}"/opt/WebullDesktop/libnghttp2.so*
}
