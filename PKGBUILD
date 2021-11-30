# Maintainer: Ashvin Nihalani <	ashvin.nihalani+aur@gmail.com>
pkgname=(webull-desktop)
pkgver=4.7.0
pkgrel=3
pkgdesc="Invest in stocks, ETFs, and options with Webull Financial, all commission-free, $0 minimum deposit."
arch=('x86_64')
url="https://webull.com"
license=('custom')
depends=('hicolor-icon-theme' 'nss')
source_x86_64=("https://pub.webull.com/us/desktop/qt_5.13.2_WebullDesktop_ubuntu_4.7.0.deb")
sha512sums_x86_64=('a49ac1355c194aa1a0479fb1a12f2cc8769a2618cbab2c2fb6fd1692e95752d9f859f10f64b8288b9ddebd7d2a1d3da7a6cc4bfb6cd419e4e97fef351ec109c8')

package(){
  bsdtar --no-same-owner -xf  data.tar.xz -C "${pkgdir}"
  mv "${pkgdir}"/usr/local/ "${pkgdir}"/opt
  rm "${pkgdir}"/opt/WebullDesktop/libnssutil3.so
  ln -s /usr/lib/libnssutil3.so "${pkgdir}"/opt/WebullDesktop/libnssutil3.so
  install -Dm644 "${pkgdir}"/opt/WebullDesktop/LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
  install -dm755 "${pkgdir}"/usr/bin
  ln -s /opt/WebullDesktop/WebullDesktop "${pkgdir}"/usr/bin
  sed -i 's|Exec=/usr/local/WebullDesktop/WebullDesktop|Exec=LD_LIBRARY_PATH=/opt/WebullDesktop WebullDesktop|' "${pkgdir}"/usr/share/applications/WebullDesktop.desktop
}
 