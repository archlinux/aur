# Maintainer: Ashwin Vishnu <ashuwish+arch at gmail dot com>

pkgname=sendanywhere
pkgver=2.6.3
pkgrel=3
pkgdesc="Direct file sharing across all platforms/devices. Send Anywhere is a multi-platform file sharing service where users can directly share digital content in real time."
arch=('i686' 'x86_64')
url="https://www.send-anywhere.com"
license=('custom:sendanywhere_eula')
provides=('sendanywhere')
makedepends=('xdg-utils' 'desktop-file-utils')
install=$pkgname.install
depends=('postgresql-libs' 'qt5-svg' 'gtk2')
source_i686=("https://update.send-anywhere.com/linux_downloads/sendanywhere_latest_i386.deb")
source_x86_64=("https://update.send-anywhere.com/linux_downloads/sendanywhere_latest_amd64.deb")
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')

prepare() {
   bsdtar xJf data.tar.xz
   bsdtar xzf control.tar.gz
   echo '==> Checking integrity with MD5sums.'
   md5sum -c md5sums --strict --quiet

   # Remove insecure RPATH
   chrpath --delete "opt/estmob/sendanywhere/sendanywhere"
}

pkgver() {
   awk -F": " '/Version/{print $2}' control
}

package() {
   mv usr opt $pkgdir

   echo '==> Copying license.'
   install -Dm644 "$pkgdir/usr/share/doc/sendanywhere/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
   rm -r "$pkgdir/usr/share/doc"
}
