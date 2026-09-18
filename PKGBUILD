# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=throne-bin
pkgver=1.3.0
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
sha256sums_x86_64=('39e42d109af589c1e35d12ed0d2af87baf1305a389f43cd11d6ffab020cd5456')
sha256sums_aarch64=('651a9366421a0dbfe7cccbd76f7ebb75e2dc07c9850d6e99764afd3f1de2a527')

package() {
  install -Dm755 "$srcdir"/Throne/{ThroneCore,Throne} -t "$pkgdir"/opt/Throne/

  for f in $(find "$srcdir"/Throne/usr -type f -printf "%P\n"); do
    install -Dm644 "$srcdir"/Throne/usr/$f -T "$pkgdir"/opt/Throne/usr/$f
  done

  install -Dm755 "$srcdir"/Throne.sh         -T "$pkgdir"/usr/bin/throne
  install -Dm644 "$srcdir"/Throne.desktop    -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/Throne/Throne.png -t "$pkgdir"/usr/share/icons/hicolor/512x512/apps/
}

