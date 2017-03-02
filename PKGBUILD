# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# EX-Maintainer: Jordan James Klassen (forivall) <forivall@gmail.com>
pkgname=wmail-bin
pkgver=2.3.1
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
sha512sums_x86_64=('a13f85f758498fab33c3a891653188799c159d9041042ab5aa14e30df8c7b400fc60e0ae4e6b29c0bb7fc761b7d32ba5f5b40b2fdd829f23f4a3de19b0da1e27')
sha512sums_i686=('99e0c78244969bce5faae3aa8fed8a0f2a33249276228259325276ca7c1af04837ad73448151c70a18ebf9c9340a9e43c6060c09f401c35881aed50553834070')

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
