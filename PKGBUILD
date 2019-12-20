# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=downlords-faf-client
pkgver=1.1.1
_pkgver_major=$(echo $pkgver | cut -d . -f 1)
_pkgver_minor=$(echo $pkgver | cut -d . -f 2)
_pkgver_tag=$(echo $pkgver | cut -d . -f 3)
#_pkgver_suffix=$(echo $pkgver | cut -d . -f 4)
#_pkgver="${_pkgver_major}.${_pkgver_minor}.${_pkgver_tag}-${_pkgver_suffix}"
#_filename="dfc_unix_${_pkgver_major}_${_pkgver_minor}_${_pkgver_tag}-${_pkgver_suffix}.tar.gz"
_pkgver="${_pkgver_major}.${_pkgver_minor}.${_pkgver_tag}"
_filename="dfc_unix_${_pkgver_major}_${_pkgver_minor}_${_pkgver_tag}.tar.gz"
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
source=("https://github.com/FAForever/downlords-faf-client/releases/download/v$_pkgver/$_filename" "https://github.com/FAForever/downlords-faf-client/raw/develop/src/media/appicon/128.png" 'DownlordsFafClient.desktop' 'downlords-faf-client')
sha256sums=('4700ab6d8c12396a7758191f08d84f51ce1609272120cc64ed473c7e144bc1e6'
            '2a5803ca2dd463aa4b53d79cff7f30e3aa7beb0d874b39c8ef59e679fbde9d3d'
            '3fd2b21da9de9f9c02dd89ee07f49c559dbb2de15f4e86a9b31f6353f608ffa6'
            '761e1b02c9075f2bd6428d5293f64ea4c8825dc35439a1acb8a4475a9b85f0e7')
noextract=()
validpgpkeys=()

pkgver() {
  _pkgver=`curl -s https://api.github.com/repos/FAForever/downlords-faf-client/releases | jq -r '.[0].tag_name' | cut -d v -f 2 | sed "s/-/\./"`
  _pkgver_major=$(echo $_pkgver | cut -d . -f 1)
  _pkgver_minor=$(echo $_pkgver | cut -d . -f 2)
   echo "${_pkgver_major}.${_pkgver_minor}.${_pkgver_tag}"
#  _pkgver_suffix=$(echo $_pkgver | cut -d . -f 4)
#   echo "${_pkgver_major}.${_pkgver_minor}.${_pkgver_tag}.${_pkgver_suffix}"
}

package() {
  mkdir -p $pkgdir/usr/share/java
  tar xfv $_filename -C $pkgdir/usr/share/java
  _subdir="downlords-faf-client-${_pkgver}"
  mv $pkgdir/usr/share/java/$_subdir $pkgdir/usr/share/java/downlords-faf-client
  install -D "$srcdir/DownlordsFafClient.desktop" "$pkgdir/usr/share/applications/DownlordsFafClient.desktop"
  install -D "$srcdir/downlords-faf-client" "$pkgdir/usr/bin/downlords-faf-client"
  install -D "$srcdir/128.png" "$pkgdir/usr/share/java/downlords-faf-client/icon.png"
  chmod +x "$pkgdir/usr/share/java/downlords-faf-client/natives/faf-uid"
}
