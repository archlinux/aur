# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=throne-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Cross-platform GUI proxy utility (Empowered by sing-box)"
arch=('x86_64' 'aarch64')
url="https://github.com/throneproj/Throne"
license=('GPL-3.0-only')
conflicts=(throne throne-git nekoray-mahdi-zarei-bin)
options=(!debug)
_appver=${pkgver/[a-z]/-&}
source=(Throne.{desktop,sh})
source_x86_64=(throne-$_appver-x86_64.zip::$url/releases/download/$_appver/Throne-$_appver-linux-amd64.zip)
source_aarch64=(throne-$_appver-aarch64.zip::$url/releases/download/$_appver/Throne-$_appver-linux-arm64.zip)
sha256sums=('1d7019ed30127fb3c7219016ed9e08bdc4809c65af13d2b02e59eed87a69082d'
            'ba44fe899a7ae34474a497a797299587d1e286e7a574578804083220caefe1bb')
sha256sums_x86_64=('5b5f27d54babfcce890cb9c566b27b63082c6115a9f844c69eedcd415b39f81f')
sha256sums_aarch64=('6f777798d86c452733539c319f3409c9cba48b34f284a2a2c317d9a05335904f')

package() {
  install -Dm755 "$srcdir"/Throne/{ThroneCore,Throne} -t "$pkgdir"/opt/Throne/

  for f in $(find "$srcdir"/Throne/usr -type f -printf "%P\n"); do
    install -Dm644 "$srcdir"/Throne/usr/$f -T "$pkgdir"/opt/Throne/usr/$f
  done

  install -Dm755 "$srcdir"/Throne.sh         -T "$pkgdir"/usr/bin/throne
  install -Dm644 "$srcdir"/Throne.desktop    -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/Throne/Throne.png -t "$pkgdir"/usr/share/icons/hicolor/512x512/apps/
}

