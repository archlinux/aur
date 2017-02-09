# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# EX-Maintainer: Jordan James Klassen (forivall) <forivall@gmail.com>
pkgname=wmail-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="The missing desktop client for Gmail & Google Inbox"
arch=("x86_64" "i686")
url="https://github.com/Thomas101/wmail"
repo="git://github.com/Thomas101/wmail.git"
license=('MIT')
options=(!strip)
provides=('wmail')
makedepends=('xdg-utils' 'desktop-file-utils')
depends=('gconf' 'gtk2' 'libxtst' 'nss' 'alsa-lib' 'libxss')
optdepends=('gvfs' 'libnotify')
conflicts=('wmail-bin<=1.3.6')
source=('wmail.desktop')

source_x86_64=("WMail_${pkgver//./_}_x64.tar.gz::https://github.com/Thomas101/wmail/releases/download/${pkgver}/WMail_${pkgver//./_}_linux_x86_64.tar.gz")
source_i686=("WMail_${pkgver//./_}_x86.tar.gz::https://github.com/Thomas101/wmail/releases/download/${pkgver}/WMail_${pkgver//./_}_linux_ia32.tar.gz")

sha512sums=('3072b76eb4285ca4330b459ade2b37057dfea632e0be3336e4e89d41f3baf1081040dc7e0292616e3e24b839c5c891ea167a52597ae949f4b412e1512f8f4e37')
sha512sums_x86_64=('556c60e7d80fc9086eb9a9ee47eeae46a1faf55ad5209068aede08ac006992fa46ec2357ccd9a51bea241c6c802c5978c1f6b8ba3a782022d4ce2ad6d682e6e3')
sha512sums_i686=('ede702e1fa814318facf1fc40b773590012b53aea2fd25f95c3242d319baaf3a9302263982d0acaa147e9a974cf2c3e7d2b3797e372bc5258e2015b84f40fff5')

package() {
  if [ $arch == "x86_64" ]
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
