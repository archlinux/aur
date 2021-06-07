# Forked form https://aur.archlinux.org/packages/android-ndk-16b/ by Oscar Morante <spacepluk@gmail.com>

pkgname=android-ndk-16b-opt
_pkg=android-ndk
pkgver=r16_b
pkgrel=3
pkgdesc="Android C/C++ developer kit. Don't override package \`android-ndk\` and support any arch"
arch=('any')
url='https://developer.android.com/ndk/'
license=('GPL' 'LGPL' 'custom')
options=('!strip' 'staticlibs')
install="android-ndk-16b.install"
provides=('android-ndk')
replaces=('android-ndk64')
depends=('ncurses5-compat-libs')
source=('android-ndk-16b.sh' "http://dl.google.com/android/repository/$_pkg-${pkgver/_/}-linux-$(uname -m).zip")
sha256sums=('eaf17f400698d5829a2b5a137f96f32f9c0e3564c708c6b84922d319d446fff3'
            'SKIP')

package() {
  install -d "$pkgdir/opt"
  mv "$_pkg-${pkgver/_/}" "$pkgdir/opt/$_pkg-16b"
  install -Dm755 android-ndk-16b.sh "$pkgdir/etc/profile.d/android-ndk-16b.sh"

  # Fix permissions
  chmod -R o=g "$pkgdir/opt/$_pkg-16b"
  find "$pkgdir/opt/$_pkg-16b" -perm 744 -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
