# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Maintainer: Mahor1221 <mahor1221 at pm dot me>

pkgname=tachidesk
_pkgname=tachidesk-server
_PkgName=Tachidesk-Server
pkgver=0.6.6_r1159
pkgrel=1
_pkgver="${pkgver%_*}"
_revnum="${pkgver#*_r}"
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=("any")
url="https://github.com/Suwayomi/$_PkgName"
license=("MPL2")
depends=("java-runtime>=8" "libc++")
optdepends=("electron: running in Electron")
provides=("$pkgname" "$_pkgname")
_jar="$_PkgName-v$_pkgver-r$_revnum.jar"
_assets="$_PkgName-v$_pkgver-r$_revnum-linux-assets"
source=("$url/releases/download/v$_pkgver/$_jar"
  "$url/releases/download/v$_pkgver/$_assets.tar.gz")
noextract=("$_jar")
sha256sums=('e91e8e6925cc9c1e654d948321b7176759710aa7ab39378389595d9e8d6f6d5b'
            'd548c792ab155640997d9f5d17f79b5c97c4adc07ab7a166d746d6a894c41d27')

package() {
  cd "$srcdir/"
  install -Dm644 "$_jar"                            "$pkgdir/usr/share/java/$_pkgname/$_PkgName.jar"
  cd "$srcdir/$_assets/"
  install -Dm644 "$_pkgname.conf"                   "$pkgdir/etc/tachidesk/server.conf"
  install -Dm644 "$_pkgname.service"                "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 "$_pkgname.sysusers"               "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "$_pkgname.tmpfiles"               "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -Dm644 "$_pkgname.desktop"                "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname.png"                    "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm755 "$_pkgname-browser-launcher.sh"    "$pkgdir/usr/bin/$_pkgname-browser"
  install -Dm755 "$_pkgname-debug-launcher.sh"      "$pkgdir/usr/bin/$_pkgname-debug"
  install -Dm755 "$_pkgname-electron-launcher.sh"   "$pkgdir/usr/bin/$_pkgname-electron"
  # keep backwards compatibility
  ln -sr "$pkgdir/usr/bin/$_pkgname-browser"        "$pkgdir/usr/bin/tachidesk"
}
