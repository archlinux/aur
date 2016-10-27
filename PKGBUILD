# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# EX-Maintainer: Jordan James Klassen (forivall) <forivall@gmail.com>
pkgname=wmail-bin
pkgver=2.0.3
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
                                                #  https://github.com/Thomas101/wmail/releases/download/v2.0.3/WMail_2_0_3_prerelease_linux_ia32.tar.gz
source_x86_64=("WMail_${pkgver//./_}_x64.tar.gz::https://github.com/Thomas101/wmail/releases/download/v${pkgver}/WMail_${pkgver//./_}_prerelease_linux_x86_64.tar.gz")
source_i686=("WMail_${pkgver//./_}_x86.tar.gz::https://github.com/Thomas101/wmail/releases/download/v${pkgver}/WMail_${pkgver//./_}_prerelease_linux_ia32.tar.gz")

sha512sums=('3072b76eb4285ca4330b459ade2b37057dfea632e0be3336e4e89d41f3baf1081040dc7e0292616e3e24b839c5c891ea167a52597ae949f4b412e1512f8f4e37')
sha512sums_x86_64=('d6082889845508e8aa526b6be893158fbd5f2295d3f15a0d74fb0a0e31b9449730b15bc8ba7353fad825c82ad452c8928a33c2b092f5026f49c0328569f593d5')
sha512sums_i686=('04dda113d6f964b4f1d85bf8b575184ae0996013ceae81a143fdb64fc5803237f468c64419713362e4bb52cb5f84afa9f92b461aac76c18f9539416e4df9dae6')

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
