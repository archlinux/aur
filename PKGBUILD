# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=lambdanative
pkgver=1.0.5
pkgrel=2
pkgdesc='Write mobile applications in Scheme'
arch=('x86_64' 'i686')
url='https://github.com/part-cw/lambdanative'
license=('custom')
depends=('android-sdk' 'android-ndk' 'gambit-c' 'zip')
#source=("git://github.com/part-cw/lambdanative.git#tag=v$pkgver")
source=("git://github.com/part-cw/lambdanative.git#commit=98b70e")
md5sums=('SKIP')

prepare() {
  cd lambdanative
  cp SETUP.template SETUP
  setconf SETUP ANDROIDSDK /opt/android-sdk
  setconf SETUP ANDROIDNDK /opt/android-ndk
  sed -i 's-= -=-g' SETUP
  setconf scripts/lambdanative LAMBDANATIVE /usr/share/lambdanative
}

package() {
  install -d "$pkgdir/usr/share"
  cp -r lambdanative "$pkgdir/usr/share/"
  install -Dm755 lambdanative/scripts/lambdanative "$pkgdir/usr/bin/lambdanative"
  install -Dm644 lambdanative/LICENSE "$pkgdir/usr/share/licenses/lambdanative/LICENSE"
  # Clean up
  rm -rf "$pkgdir/usr/share/lambdanative/.git"
  rm "$pkgdir/usr/share/lambdanative/scripts/lambdanative" \
    "$pkgdir/usr/share/lambdanative/.gitignore" \
    "$pkgdir/usr/share/lambdanative/LICENSE"
}

# vim:set ts=2 sw=2 et:
