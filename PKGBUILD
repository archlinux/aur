# Maintainer: Wing Hei Chan <whmunkchan@outlook.com>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>
# Contributor: networkjanitor <networkjanitor@xyooz.net>

_pkgname=input-overlay
pkgname="obs-plugin-$_pkgname-bin"
pkgver=5.0.3
pkgrel=1
groups=('obs-plugins')
pkgdesc="obs-studio plugin to show keyboard, gamepad and mouse input on stream."
arch=("x86_64")
url="https://github.com/univrsal/input-overlay"
license=("GPL")
provides=("obs-input-overlay")
conflicts=("obs-input-overlay")
depends=("obs-studio>=19.0.3" "libuiohook")
_source=("$_pkgname-$pkgver-linux-x86_64.zip"
         "$_pkgname-$pkgver-presets.zip")
source=("${_source[@]/#/$url/releases/download/v$pkgver/}")
noextract=("${_source[1]}")
sha256sums=('5e21391e7e4a010fb7ecbd23a5e33b827e27fc98dcd1842e7d6a6157a3ce3274'
            '3eb92702fb5c3f07c5b42c312757b5d44a5ef7bc0ae1ef1eb3f978ff98fc82c3')

package() {
  local from="$srcdir/$_pkgname"

  local lib="$pkgdir/usr/lib/obs-plugins"
  mkdir -p "$lib"
  cp {"$from/bin/64bit","$lib"}/"$_pkgname.so"

  local share="$pkgdir/usr/share/obs/obs-plugins/$_pkgname"
  mkdir -p "$share"
  cp -r "$from/data"/* "$share"

  local preset="$share/presets"
  mkdir "$preset"
  bsdtar xf "${_source[1]}" --directory "$preset" --exclude "README*"
}
# Local Variables:
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
