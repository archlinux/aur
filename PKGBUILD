# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=tachidesk
_pkgname=tachidesk-server
_PkgName=Tachidesk-Server
pkgver=0.7.0_r1197
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
sha256sums=('e033b55a2042bbff32a45809741984c105d0d716960256edf0de5310ba265550'
            'efb90a7343fcfb0e18783e5eb7a101e784e2171fc21c50f2892f5a16c1c0d363')

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
