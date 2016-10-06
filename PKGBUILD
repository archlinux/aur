# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# EX-Maintainer: Jordan James Klassen (forivall) <forivall@gmail.com>
pkgname=wmail-bin
pkgver=1.4.0
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
source_x86_64=("WMail_${pkgver//./_}_x64.tar.gz::https://github.com/Thomas101/wmail/releases/download/v${pkgver}/WMail_${pkgver//./_}_prerelease_linux_x64.tar.gz")
source_i686=("WMail_${pkgver//./_}_x86.tar.gz::https://github.com/Thomas101/wmail/releases/download/v${pkgver}/WMail_${pkgver//./_}_prerelease_linux_x86.tar.gz")

# noextract=("wmail-linux-v${pkgver}.zip")
sha512sums=('3072b76eb4285ca4330b459ade2b37057dfea632e0be3336e4e89d41f3baf1081040dc7e0292616e3e24b839c5c891ea167a52597ae949f4b412e1512f8f4e37')
sha512sums_x86_64=('1ea71b2ee88a4833ca99d283c1593d681d17abaf41ddf7d6dada5f5e20b9ba4ab1c0ae54819324d89a0aeae85a51f228733c81efbcffa1a71391f4bd78a44e5f')
sha512sums_i686=('0a89bf2a22b0a7f7f7e510c588b8f61bb671cce7d1c59b38e29e7c8c51b873b27c12014c9094d73acbaf098ac17d15d53ae8b1235203d13539d4e04567f2dc5c')

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
