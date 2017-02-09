# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# EX-Maintainer: Jordan James Klassen (forivall) <forivall@gmail.com>
pkgname=wmail-bin
pkgver=2.1.1
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
sha512sums_x86_64=('491392cd2a808736f8f3200f00f0550c8cda64aed2a3bdb5e60066f90762473e5442fc489fa63fb50e0751f54e27d4ddf6600c3e5efe312a65ee7cce29e53601')
sha512sums_i686=('f2040eef5b4987177895e582f3574fa63633a969fe9a2b977045626688425e5ea6371e8983d8462080f0503fc653f971eaf168b7fd2be217be5f2533b73cd4a6')

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
