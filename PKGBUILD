# Maintainer: LinArcX <linarcx@gmail.com>

_pkg=android-ndk
pkgver=r17c

pkgname=$_pkg-$pkgver
pkgrel=1
pkgdesc='Android C/C++ developer kit (r17c)'
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
# https://dl.google.com/android/repository/android-ndk-r17c-linux-x86_64.zip
source=("android-ndk.sh"
        "http://dl.google.com/android/repository/$_pkg-$pkgver-linux-x86_64.zip")
sha256sums=('159d3690212bbf9bf01751b682784525326d058da364d6832050645eef30bfec'
            '3f541adbd0330a9205ba12697f6d04ec90752c53d6b622101a2a8a856e816589 ')

package() {
  install -d "$pkgdir/opt"
  mv "$_pkg-$pkgver" "$pkgdir/opt/$_pkg"

  install -Dm755 android-ndk.sh "$pkgdir/etc/profile.d/android-ndk.sh"

  # Fix broken permissions
  chmod -R o=g "$pkgdir/opt/$_pkg"
  find "$pkgdir/opt/$_pkg" -perm 744 -exec chmod 755 {} +
}