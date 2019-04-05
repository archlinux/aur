# Maintainer: Echizen Ryoma <echizenryoma.zhang@gmail.com>
# Contributor: Ouyang Jun <ouyangjun1999@gmail.com>
# Contributor: Astro Benzene <universebenzene at sina dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jove Yu <yushijun110 [at] gmail.com>
# Contributor: Ariel AxionL <axionl at aosc dot io>

pkgname=wps-office-bin
pkgver=11.1.0.8372
pkgrel=1
pkgdesc="Kingsoft Office (WPS Office) is an office productivity suite"
arch=('i686' 'x86_64')
license=("custom")
url="http://wps-community.org/"
depends=('alsa-lib' 'gtk2' 'xorg-mkfontdir' 'openssl-1.0' 'sdl2' 'libpng12' 'libxss' 'libxtst' 'libsm' 'nss')
optdepends=('cups: for printing support'
            'libjpeg-turbo: JPEG image codec support'
            'pango: for complex (right-to-left) text support'
            'ttf-wps-fonts: Symbol fonts required by wps-office')
provides=('wps-office')
conflicts=('wps-office')
install="${pkgname}.install"
source_i686=("https://wdl1.cache.wps.cn/wps/download/ep/Linux2019/${pkgver##*.}/wps-office_${pkgver}_i386.deb")
source_x86_64=("https://wdl1.cache.wps.cn/wps/download/ep/Linux2019/${pkgver##*.}/wps-office_${pkgver}_amd64.deb")
sha1sums_i686=('d2a12b05fb2cb8f19a12c266f1e4477f199906ad')
sha1sums_x86_64=('3b7a199c7da8ea64aaa2f00d6474a11c9714eb8a')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  
  install -Dm644 "${pkgdir}/opt/kingsoft/wps-office/office6/mui/default/EULA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/EULA.txt"
  
  msg2 "Removing Debian Cron job..."
  rm -r "${pkgdir}/etc/cron.d" "${pkgdir}/etc/logrotate.d" "${pkgdir}/etc/xdg/autostart"
}
