# Maintainer:
# Contributor: Dominik Schwaiger <domi.schwaiger04@gmail.com>

_pkgname="sonyheadphonesclient"
pkgname="$_pkgname-bin"
pkgver=1.3.2
pkgrel=1
pkgdesc="Desktop client recreating the functionality of the Sony Headphones app (XM3/XM4)"
url="https://github.com/Plutoberth/SonyHeadphonesClient"
license=('MIT')
arch=("x86_64")

depends=(
  'bluez-libs'
  'dbus'
  'glew'
  'glfw'
  'libglvnd'
)

provides=("sonyheadphonesclient")
conflicts=("sonyheadphonesclient")

source=(
  "$_pkgname-$pkgver.zip"::"$url/releases/download/v$pkgver/SonyHeadphonesClient-linux-x64.zip"
  "LICENSE-$pkgver"::"$url/raw/refs/tags/v$pkgver/LICENSE"
)
sha256sums=(
  '6a58c20abe26b7ffb263f81e2dcaf779ea187243623c8b39eaac708249bc8013'
  '0b3db3e11db69b6d0de551cb7d9a56cc65be7f8fd912bcf6bae61ba57df36c34'
)

package() {
  install -Dm755 SonyHeadphonesClient "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/sonyheadphonesclient-bluetooth.desktop" << END
[Desktop Entry]
Name=Sony Headphones Client [XM3/XM4]
Comment=[XM3/XM4] A Linux client recreating the functionality of the Sony Headphones app
Exec=$_pkgname
Terminal=false
Categories=Utility;
Type=Application
Icon=audio-headphones
END

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
