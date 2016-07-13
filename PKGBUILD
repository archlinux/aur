# Maintainer: farwayer <farwayer@gmail.com>

_pkg=android-ndk
pkgver=r10_e

pkgname=$_pkg-${pkgver//[r|_]/}
pkgrel=1
pkgdesc='Android C/C++ developer kit'
arch=('x86_64')
url='https://developer.android.com/ndk/'
license=('GPL' 'LGPL' 'custom')
options=('!strip' 'staticlibs')
backup=('etc/profile.d/android-ndk.sh')
install="android-ndk.install"
provides=('android-ndk')
conflicts=('android-ndk')
replaces=('android-ndk64')
depends=('ncurses5-compat-libs')
source=('android-ndk.sh' "http://dl.google.com/android/repository/$_pkg-${pkgver/_/}-linux-x86_64.zip")
sha256sums=('5bc58ccd7e7de03c9656ca8f13fb9bf9dff2eeee31a2670ce04a4b97be73dc95'
            'ee5f405f3b57c4f5c3b3b8b5d495ae12b660e03d2112e4ed5c728d349f1e520c')

package() {
  install -d "$pkgdir/opt"
  mv "$_pkg-${pkgver/_/}" "$pkgdir/opt/$_pkg"

  install -Dm755 android-ndk.sh "$pkgdir/etc/profile.d/android-ndk.sh"

  # Fix broken permissions
  chmod -R o=g "$pkgdir/opt/$_pkg"
  find "$pkgdir/opt/$_pkg" -perm 744 -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
