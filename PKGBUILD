# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=downlords-faf-client
pkgver=0.9.3
_pkgver_major=0
_pkgver_minor=9
_pkgver_tag=3
_pkgver_suffix=beta
_pkgver="${_pkgver_major}.${_pkgver_minor}.${_pkgver_tag}-${_pkgver_suffix}"
_filename="_dfc_unix_${_pkgver_major}_${_pkgver_minor}_${_pkgver_tag}-${_pkgver_suffix}.tar.gz"
pkgrel=1
epoch=0
pkgdesc="Forged Alliance Forever - Lobby Client. Community-driven client system for Supreme Commander: Forged Alliance. Downlord's Java client reimplementation."
url="http://www.faforever.com/"
arch=('any')
license=('MIT')
groups=()
checkdepends=()
optdepends=()
depends=('jre10-openjdk')
makedepends=('jq')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/FAForever/downlords-faf-client/releases/download/v$_pkgver_major.$_pkgver_minor.$_pkgver_tag-$_pkgver_suffix/$_filename" "https://github.com/FAForever/downlords-faf-client/raw/develop/src/media/appicon/128.png" 'DownlordsFafClient.desktop' 'downlords-faf-client')
sha256sums=('4c8bc35407d5a3afe9dbacf95364205e761d051bb90820c822b5a502b231c9de' '2a5803ca2dd463aa4b53d79cff7f30e3aa7beb0d874b39c8ef59e679fbde9d3d' 'SKIP' 'SKIP')
noextract=()
validpgpkeys=()

pkgver() {
  _pkgver=`curl -s https://api.github.com/repos/FAForever/downlords-faf-client/releases | jq -r '.[0].tag_name' | cut -d v -f 2 | sed "s/-/\./"`
  _pkgver_major=echo $_pkgver | cut -d . -f 1
  _pkgver_minor=echo $_pkgver | cut -d . -f 2
  _pkgver_tag=echo $_pkgver | cut -d . -f 3
  _pkgver_suffix=echo $_pkgver | cut -d . -f 4
  echo "${_pkgver_major}.${_pkgver_minor}.${_pkgver_tag}"
}

package() {
  mkdir -p $pkgdir/usr/share/java
  tar xfv $_filename -C $pkgdir/usr/share/java
  _subdir="downlords-faf-client-${_pkgver}"
  mv $pkgdir/usr/share/java/$_subdir $pkgdir/usr/share/java/downlords-faf-client
  install -D "$srcdir/DownlordsFafClient.desktop" "$pkgdir/usr/share/applications/DownlordsFafClient.desktop"
  install -D "$srcdir/downlords-faf-client" "$pkgdir/usr/bin/downlords-faf-client"
  install -D "$srcdir/128.png" "$pkgdir/usr/share/java/downlords-faf-client/icon.png"
  chmod +x "$pkgdir/usr/share/java/downlords-faf-client/lib/faf-uid"
}
