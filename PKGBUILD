# Maintainer: meanlint <meanlint@outlook.com>
# Maintainer: shaka042 <chefmayonaisse.observant341 at slmails dot com>
# Contributor: Aria Moradi <aria.moradi007 at gmail dot com>
# Contributor: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=suwayomi-server-preview-bin
_pkgname=suwayomi-server
_PkgName=Suwayomi-Server
pkgver=2.0.1743
pkgrel=1
_pkgver="${pkgver%_*}"
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=("any")
url="https://github.com/Suwayomi/Suwayomi-Server-preview"
license=("MPL2")
depends=("java-runtime>=8" "libc++")
optdepends=("electron: running in Electron")
provides=("suwayomi" "$_pkgname" "tachidesk" "tachidesk-server")
conflicts=("tachidesk")
_jar="$_PkgName-v$_pkgver.jar"
_assets="$_PkgName-v$_pkgver-linux-assets"
backup=("etc/suwayomi/server.conf")
source=("$url/releases/download/v$_pkgver/$_jar"
  "$url/releases/download/v$_pkgver/$_assets.tar.gz")
noextract=("$_jar")
sha256sums=('SKIP'
            'SKIP')

package() {
  cd "$srcdir/"
  install -Dm644 "$_jar"                            "$pkgdir/usr/share/java/$_pkgname/bin/$_PkgName.jar"
  cd "$srcdir/$_assets/"
  install -Dm644 "$_pkgname.conf"                   "$pkgdir/etc/suwayomi/server.conf"
  install -Dm644 "$_pkgname.service"                "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 "$_pkgname.sysusers"               "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "$_pkgname.tmpfiles"               "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -Dm644 "$_pkgname.desktop"                "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname.png"                    "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm755 "$_pkgname.sh"                     "$pkgdir/usr/bin/$_pkgname"
  # keep backwards compatibility
  ln -sr "$pkgdir/usr/bin/$_pkgname"                "$pkgdir/usr/bin/suwayomi"
}
