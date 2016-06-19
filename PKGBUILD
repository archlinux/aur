# Maintainer: Ashwin Vishnu <ashuwish+arch at gmail dot com>

pkgname=sendanywhere
pkgver=2.6.3
pkgrel=1
pkgdesc="Direct file sharing across all platforms/devices. Send Anywhere is a multi-platform file sharing service where users can directly share digital content in real time."
arch=('i686' 'x86_64')
url="https://www.send-anywhere.com"
license=('custom:sendanywhere_eula')
provides=('sendanywhere')
makedepends=('xdg-utils' 'desktop-file-utils')
install=$pkgname.install
depends=('gcc-libs>=4.6.3' 'glibc>=2.15' 'postgresql-libs' 'qt5-svg' 'gtk2')
source_i686=("https://update.send-anywhere.com/linux_downloads/sendanywhere_latest_i386.deb")
source_x86_64=("https://update.send-anywhere.com/linux_downloads/sendanywhere_latest_amd64.deb")
md5sums_i686=('ecda4a4d993cd8c92051a27cf2d8f604')
md5sums_x86_64=('ead96579d04a4a5a16f50f28473401a3')
# sha256sums_i686=('SKIP')
# sha256sums_x86_64=('SKIP')


pkgver() {
   cd $srcdir
   bsdtar xzf control.tar.gz
   awk -F": " '/Version/{print $2}' control
}

prepare() {
   cd $srcdir
   bsdtar xJf data.tar.xz
   # echo '==> Checking integrity with MD5sums.'
   # md5sum -c md5sums --strict --quiet
}

package() {
   cd $srcdir && mv usr opt $pkgdir
   echo '==> Copying license.'
   install -Dm644 "$pkgdir/usr/share/doc/sendanywhere/copyright"\
       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
