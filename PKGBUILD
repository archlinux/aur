# Maintainer: Ivan Puntiy <ivan.puntiy-at-gmail>
pkgname=unix-runescape-client
pkgver=3.9.10
pkgrel=1
pkgdesc="RuneScape client for Linux and Unix"
arch=(any)
url="http://hkprojects.weebly.com/runescape-client-for-linux-and-unix.html"
license=(GPL2)
depends=('java-runtime' 'perl' 'xterm' 'p7zip')
optdepends=(
  'zenity: better UI'
  'perl-wx: for rsu-settings'
  'wine: for "compatibility mode" fix'
  'alsa-oss: for "force alsa" fix'
  'pulseaudio: for "force pulseaudio" fix'
)
conflicts=('runescape-client-bin')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/HikariKnight/rsu-client/tarball/v$pkgver")

package() {
  local _instdir="$pkgdir"/opt/runescape
  local _hash=$(tar -tf "$srcdir"/$pkgname-$pkgver.tar.gz | head -1 | sed 's:HikariKnight-rsu-client-\([0-9a-fA-F]*\)/:\1:g')

  cd "$srcdir/HikariKnight-rsu-client-$_hash/runescape"

  mkdir -p "$_instdir"/{share,modules} "$pkgdir"/usr/{bin,share/applications}

  # copy the stuff
  cp -t "$_instdir" *.txt runescape update-runescape-client rsu-settings AUTHORS
  cp -R share "$_instdir"/
  cp -R modules "$_instdir"/
  cp -R templates/packaging/usr/share "$pkgdir"/usr/
  ## jawt.dll is no longer packaged upstream ##
  # cp -R win32/jawt "$_instdir"/win32/
 
  # symlink executables
  ln -s ../../opt/runescape/runescape "$pkgdir"/usr/bin/runescape
  ln -s ../../opt/runescape/update-runescape-client "$pkgdir"/usr/bin/update-runescape-client
  ln -s ../../opt/runescape/rsu-settings "$pkgdir"/usr/bin/rsu-settings
}

md5sums=('99baef5cfb5b5597aeebaa20c3bcf68c')
