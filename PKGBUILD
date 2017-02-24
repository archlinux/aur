# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# EX-Maintainer: Jordan James Klassen (forivall) <forivall@gmail.com>
pkgname=wmail-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="The missing desktop client for Gmail & Google Inbox"
arch=("x86_64" "i686")
url="https://github.com/Thomas101/wmail"
_repo="git://github.com/Thomas101/wmail.git"
license=('MIT')
options=(!strip)
provides=('wmail')
makedepends=('xdg-utils' 'desktop-file-utils')
depends=('gconf' 'gtk2' 'libxtst' 'nss' 'alsa-lib' 'libxss')
optdepends=('gvfs' 'libnotify')
source=('wmail.desktop')

source_x86_64=("WMail_${pkgver//./_}_x64.tar.gz::${url}/releases/download/v${pkgver}/WMail_${pkgver//./_}_prerelease_linux_${CARCH}.tar.gz")
source_i686=("WMail_${pkgver//./_}_ia32.tar.gz::${url}/releases/download/v${pkgver}/WMail_${pkgver//./_}_prerelease_linux_ia32.tar.gz")

sha512sums=('3072b76eb4285ca4330b459ade2b37057dfea632e0be3336e4e89d41f3baf1081040dc7e0292616e3e24b839c5c891ea167a52597ae949f4b412e1512f8f4e37')
sha512sums_x86_64=('d97eea71ddb8abce13625c712f4713fa850287e745400ebe1dd6eab40d95e6efd1d1065c888a3e41c424308e70033bc4b727070794df4f17ee3666dd3a914ff6')
sha512sums_i686=('efc19dddd6d21b23c1570bba907e6dc0dffe1072b1006265d535c0b391a5558c4a1bbfa9c24cf4defaffe12d01d14fa51845e4da8cd197738efc17d2fa2b54f2')

package() {
  if [ ${CARCH} == "x86_64" ]
  then
      cd ${srcdir}/WMail-linux-x64
  else
      cd ${srcdir}/WMail-linux-ia32
  fi

  mkdir -p "${pkgdir}/usr/share/wmail"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  cp -R ./* "${pkgdir}/usr/share/wmail"
  ln -s "/usr/share/wmail/WMail" "${pkgdir}/usr/bin/wmail"
  cp $srcdir/wmail.desktop $pkgdir/usr/share/applications/wmail.desktop

}
