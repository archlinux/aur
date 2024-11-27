# Maintainer:

: ${_install_path:=usr/lib}

_pkgname="legcord"
pkgname="$_pkgname-bin"
pkgver=1.0.5
pkgrel=1
pkgdesc="Discord client with builtin client mod & theme support."
url="https://github.com/Legcord/Legcord"
license=('OSL-3.0')
arch=('x86_64' 'aarch64')

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip')

_pkgsrc="${_pkgname^}-$pkgver-linux-$CARCH"
_pkgext="rpm"

source_x86_64=("${_pkgname^}-$pkgver-linux-x86_64.$_pkgext"::"$url/releases/download/v$pkgver/${_pkgname^}-$pkgver-linux-x86_64.$_pkgext")
source_aarch64=("${_pkgname^}-$pkgver-linux-aarch64.$_pkgext"::"$url/releases/download/v$pkgver/${_pkgname^}-$pkgver-linux-aarch64.$_pkgext")

sha256sums_x86_64=('cea3d705cc7b8a4ddafec48a53d14fabed80c9b783537bd66273055ba88ef634')
sha256sums_aarch64=('5b359ea07e09bbe4bdb575eb98cb5fd03aef9023e9e3be306b15ced7bf7486a1')

package() {
  install -dm755 "$pkgdir/$_install_path/$_pkgname"
  mv opt/Legcord/* "$pkgdir/$_install_path/$_pkgname/"

  install -dm755 "$pkgdir/usr/bin"
  ln -srf "$pkgdir/$_install_path/$_pkgname/legcord" "$pkgdir/usr/bin/legcord"

  install -Dm644 "usr/share/icons/hicolor/1024x1024/apps/legcord.png" -t "$pkgdir/usr/share/pixmaps/"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=${_pkgname^}
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
Categories=Internet;Network;InstantMessaging;
END

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
