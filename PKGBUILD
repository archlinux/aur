# Maintainer: Echizen Ryoma <echizenryoma.zhang@gmail.com>
# Contributor: Ouyang Jun <ouyangjun1999@gmail.com>
# Contributor: Astro Benzene <universebenzene at sina dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jove Yu <yushijun110 [at] gmail.com>
# Contributor: Ariel AxionL <axionl at aosc dot io>

pkgname=wps-office-bin
pkgver=11.1.0.8392
pkgrel=1
pkgdesc="Kingsoft Office (WPS Office) Debian Binary Package"
arch=('i686' 'x86_64')
license=("custom")
url="http://wps-community.org/"
depends=('alsa-lib' 'gtk2' 'xorg-mkfontdir' 'openssl-1.0' 'sdl2' 'libpng12' 'libxss' 'libxtst' 'libsm' 'nss')
optdepends=('cups: for printing support'
            'curl: An URL retrieval utility and library'
            'libjpeg-turbo: JPEG image codec support'
            'pango: for complex (right-to-left) text support'
            'ttf-wps-fonts: Symbol fonts required by wps-office')
provides=('wps-office')
conflicts=('wps-office')
install="${pkgname}.install"
source_i686=("https://wdl1.cache.wps.cn/wps/download/ep/Linux2019/${pkgver##*.}/wps-office_${pkgver}_i386.deb")
source_x86_64=("https://wdl1.cache.wps.cn/wps/download/ep/Linux2019/${pkgver##*.}/wps-office_${pkgver}_amd64.deb")
sha1sums_i686=('60b1c9e33ee6fc1edcefe40dc9ec529d4a668825')
sha1sums_x86_64=('edb1bc215e46c46bb979869e374788498486b56c')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  
  install -Dm644 "${pkgdir}/opt/kingsoft/wps-office/office6/mui/default/EULA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/EULA.txt"
  
  msg2 "Removing Debian Cron job..."
  rm -r "${pkgdir}/etc/cron.d" "${pkgdir}/etc/logrotate.d" "${pkgdir}/etc/xdg/autostart"
}
