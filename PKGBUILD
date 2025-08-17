# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=throne-bin
pkgver=1.0.2_beta.6
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
sha256sums_x86_64=('c082afa50827bc4af792db6788a2d45fdf9b470f154408bf9849229a967826e7')
sha256sums_aarch64=('ff9f4b94349edeff88ab2d2045a8f1847b4a0b12bdeb7f180b4ba5443b11f883')

package() {
  install -Dm755 "$srcdir"/Throne/{Core,Throne}   -t "$pkgdir"/opt/Throne/

  for f in $(find "$srcdir"/Throne/usr -type f -printf "%P\n"); do
    install -Dm644 "$srcdir"/Throne/usr/$f -T "$pkgdir"/opt/Throne/usr/$f
  done

  install -Dm755 "$srcdir"/Throne.sh         -T "$pkgdir"/usr/bin/throne
  install -Dm644 "$srcdir"/Throne.desktop    -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/Throne/Throne.png -t "$pkgdir"/usr/share/icons/hicolor/512x512/apps/
}

