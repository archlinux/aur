# Maintainer: Wing Hei Chan <whmunkchan@outlook.com>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>
# Contributor: networkjanitor <networkjanitor@xyooz.net>

_pkgname=input-overlay
pkgname="obs-plugin-$_pkgname-bin"
pkgver=5.0.4
pkgrel=1
groups=('obs-plugins')
pkgdesc="obs-studio plugin to show keyboard, gamepad and mouse input on stream."
arch=("x86_64")
url="https://github.com/univrsal/input-overlay"
license=("GPL")
provides=("obs-input-overlay")
conflicts=("obs-input-overlay")
depends=("obs-studio>=28.0.0" "libuiohook")
_source=("$_pkgname-$pkgver-linux-x86_64.zip"
         "$_pkgname-$pkgver-presets.zip")
source=("${_source[@]/#/$url/releases/download/v$pkgver/}")
noextract=("${_source[1]}")
sha256sums=('556a6cc643f5a242161f9ba71c24fa750d12e7d8e2298c8a89a78d6169a009ec'
            'efdc9d65dd9ed8c0670159b5697284b55c8057aea5a508afde634a23c799d698')

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
