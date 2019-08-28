# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_pkg=android-ndk
pkgver=r18b

pkgname=$_pkg-$pkgver
pkgrel=1
pkgdesc="Android C/C++ developer kit ($pkgver)"
arch=('x86_64')
url='https://developer.android.com/ndk/'
license=('GPL' 'LGPL' 'custom')
options=('!strip' 'staticlibs')
backup=('etc/profile.d/android-ndk.sh')
# install="android-ndk.install"
provides=('android-ndk')
conflicts=('android-ndk')
replaces=('android-ndk64')
depends=('ncurses5-compat-libs')
source=("android-ndk.sh"
        "http://dl.google.com/android/repository/$_pkg-$pkgver-linux-x86_64.zip")
sha256sums=('5bc58ccd7e7de03c9656ca8f13fb9bf9dff2eeee31a2670ce04a4b97be73dc95'
            '4f61cbe4bbf6406aa5ef2ae871def78010eed6271af72de83f8bd0b07a9fd3fd')

package() {
  install -d "$pkgdir/opt"
  mv "$_pkg-$pkgver" "$pkgdir/opt/$_pkg"

  install -Dm755 android-ndk.sh "$pkgdir/etc/profile.d/android-ndk.sh"

  # Fix broken permissions
  chmod -R o=g "$pkgdir/opt/$_pkg"
  find "$pkgdir/opt/$_pkg" -perm 744 -exec chmod 755 {} +
}
