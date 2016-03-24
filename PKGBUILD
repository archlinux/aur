# Maintainer: Ashwin Vishnu <ashuwish+arch at gmail dot com>

pkgname=sendanywhere
pkgver=2.3.15
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
# sha256sums_i686=('SKIP')
# sha256sums_x86_64=('SKIP')
sha256sums_i686=('f26538a9922272bdbdc0f0df9e36a7a0b6958aab065a9083bb95bea9f0951291')
sha256sums_x86_64=('b6ceaafac14557225eb6b5665deb68bfc93b6a341add93f613578562aee3f85f')

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
