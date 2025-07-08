# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=throne-bin
pkgver=1.0.0beta.1
pkgrel=1
pkgdesc="Qt based cross-platform GUI proxy configuration manager (backend: sing-box)"
arch=('x86_64' 'aarch64')
url="https://github.com/throneproj/Throne"
license=('GPL-3.0-only')
depends=(qt6-base qt6-charts)
optdepends=('qt6-wayland: to run application in a Wayland session')
conflicts=(throne throne-git nekoray-mahdi-zarei-bin)
options=(!debug)
_appver=${pkgver/[a-z]/-&}
source=(
  ${url//github/raw.githubusercontent}/refs/heads/dev/res/public/Throne.png
  Throne.{desktop,sh}
)
source_x86_64=(throne-$_appver-x86_64.zip::$url/releases/download/$_appver/Throne-$_appver-linux-amd64.zip)
source_aarch64=(throne-$_appver-aarch64.zip::$url/releases/download/$_appver/Throne-$_appver-linux-arm64.zip)
sha256sums=('823fcc2deac3670972d3e9c52dc1c07dad4386cf34435d52c930453e05457533'
            '39e430640b65dd6c6a4f6a0093a9aaa9470def1079f6e281a1fef73179d15967'
            '9b33d3fea0b9b94617da57434ec3e751d9be97c3a71a9e9f267b4ef15d5deb7f')
sha256sums_x86_64=('fe9dad8379891b236b65ef532fd73b188cbbabc693ed585c3b74b538ffc0fb29')
sha256sums_aarch64=('752afe34bef941e8f3a8bf615787ce6e34ebaaf5faba190a59a367f00beb9ae5')

package() {
  install -Dm755 "$srcdir"/Throne.sh              -T "$pkgdir"/usr/bin/throne
  install -Dm755 "$srcdir"/Throne/{Core,Throne}   -t "$pkgdir"/usr/lib/throne/
  install -Dm644 "$srcdir"/Throne/geo{ip,site}.db -t "$pkgdir"/usr/lib/throne/
  install -Dm644 "$srcdir"/Throne.desktop         -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/Throne.png             -t "$pkgdir"/usr/share/icons/hicolor/512x512/apps/
}

