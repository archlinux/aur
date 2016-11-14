# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# EX-Maintainer: Jordan James Klassen (forivall) <forivall@gmail.com>
pkgname=wmail-bin
pkgver=2.0.7
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

source_x86_64=("WMail_${pkgver//./_}_x64.tar.gz::https://github.com/Thomas101/wmail/releases/download/v${pkgver}/WMail_${pkgver//./_}_prerelease_linux_x86_64.tar.gz")
source_i686=("WMail_${pkgver//./_}_x86.tar.gz::https://github.com/Thomas101/wmail/releases/download/v${pkgver}/WMail_${pkgver//./_}_prerelease_linux_ia32.tar.gz")

sha512sums=('3072b76eb4285ca4330b459ade2b37057dfea632e0be3336e4e89d41f3baf1081040dc7e0292616e3e24b839c5c891ea167a52597ae949f4b412e1512f8f4e37')
sha512sums_x86_64=('da345afac7497e4dfb86b6d9d0bceca84c577d4ee882bb5a400677d8da353aca5b98e7db345214adcda3363738ab15f8228910a99d1fa85535469ee7076baa58')
sha512sums_i686=('ecbe9f02131a80984d1aadeb9c8801e32df82bec84679dde5ff2165bb702afc1a7d3a99b371c6add3ea58fa0f9a3b0f0177c96812c54d080a159ed81c1f0a30d')

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
