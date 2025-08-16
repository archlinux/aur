# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=throne-bin
pkgver=1.0.2_beta.3
pkgrel=1
pkgdesc="Cross-platform GUI proxy utility (Empowered by sing-box)"
arch=('x86_64' 'aarch64')
url="https://github.com/throneproj/Throne"
license=('GPL-3.0-only')
conflicts=(throne throne-git nekoray-mahdi-zarei-bin)
options=(!debug)
_appver=${pkgver//_/-}
source=(Throne.{desktop,sh})
source_x86_64=(throne-$_appver-x86_64.zip::$url/releases/download/$_appver/Throne-$_appver-linux-amd64.zip)
source_aarch64=(throne-$_appver-aarch64.zip::$url/releases/download/$_appver/Throne-$_appver-linux-arm64.zip)
sha256sums=('1d7019ed30127fb3c7219016ed9e08bdc4809c65af13d2b02e59eed87a69082d'
            'e7e6eb9a7b9485a5e8ce4a2a0be5538efdb30365c1807f35c2eae17331d405d7')
sha256sums_x86_64=('02f296a052d5e5de61159bc745a41c6fd9b67b455e8f1f9fe3f0e57c71aef41a')
sha256sums_aarch64=('d226e641dcc84f8a0f15bea1a6254af10d7ca02e1d344c60eb8c4392f08c2252')

package() {
  install -Dm755 "$srcdir"/Throne/{Core,Throne}   -t "$pkgdir"/opt/Throne/

  for f in $(find "$srcdir"/Throne/usr -type f -printf "%P\n"); do
    install -Dm644 "$srcdir"/Throne/usr/$f -T "$pkgdir"/opt/Throne/usr/$f
  done

  install -Dm755 "$srcdir"/Throne.sh         -T "$pkgdir"/usr/bin/throne
  install -Dm644 "$srcdir"/Throne.desktop    -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/Throne/Throne.png -t "$pkgdir"/usr/share/icons/hicolor/512x512/apps/
}

