# Maintainer: Oscar Morante <spacepluk@gmail.com>

pkgname=android-ndk-16b
_pkg=android-ndk
pkgver=r16_b
pkgrel=2
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
sha256sums=('700e240e5f308486c46978112227eb7238a4dddfa76f2095bcdf11c25500dd0f'
            'bcdea4f5353773b2ffa85b5a9a2ae35544ce88ec5b507301d8cf6a76b765d901')

package() {
  install -d "$pkgdir/opt"
  mv "$_pkg-${pkgver/_/}" "$pkgdir/opt/$_pkg"
  install -Dm755 android-ndk.sh "$pkgdir/etc/profile.d/android-ndk.sh"

  # Fix permissions
  chmod -R o=g "$pkgdir/opt/$_pkg"
  find "$pkgdir/opt/$_pkg" -perm 744 -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
