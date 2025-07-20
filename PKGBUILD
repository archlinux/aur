# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=throne-bin
pkgver=1.0.0beta.2
pkgrel=1
pkgdesc="Cross-platform GUI proxy utility (Empowered by sing-box)"
arch=('x86_64' 'aarch64')
url="https://github.com/throneproj/Throne"
license=('GPL-3.0-only')
conflicts=(throne throne-git nekoray-mahdi-zarei-bin)
options=(!debug)
_appver=${pkgver/[a-z]/-&}
source=(
  Throne.png::${url//github/raw.githubusercontent}/refs/heads/dev/res/public/Throne.png
  Throne.{desktop,sh}
)
source_x86_64=(throne-$_appver-x86_64.zip::$url/releases/download/$_appver/Throne-$_appver-linux-amd64.zip)
source_aarch64=(throne-$_appver-aarch64.zip::$url/releases/download/$_appver/Throne-$_appver-linux-arm64.zip)
sha256sums=('SKIP'
            '6158ab6031a88268acc87ffba11654a54ee8f578f0efc45e1b8b362a0c7d0465'
            '4d034e434659872f87950a9e91265eda5d7361bd805a660190bcd1aa05a65d4f')
sha256sums_x86_64=('181ed0a11c8e2d8300f503b119fa5fad560e9dcd595c197b317695b004ba8fdd')
sha256sums_aarch64=('f78ceaadadb5e12380f96987422850e2f7ef29ffa24412bf938ff5f210043bb7')

package() {
  install -Dm755 "$srcdir"/Throne/{Core,Throne}   -t "$pkgdir"/opt/Throne/
  install -Dm644 "$srcdir"/Throne/geo{ip,site}.db -t "$pkgdir"/opt/Throne/

  for f in $(find "$srcdir"/Throne/usr -type f -printf "%P\n"); do
    install -Dm644 "$srcdir"/Throne/usr/$f -T "$pkgdir"/opt/Throne/usr/$f
  done

  install -Dm755 "$srcdir"/Throne.sh      -T "$pkgdir"/usr/bin/throne
  install -Dm644 "$srcdir"/Throne.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/Throne.png     -t "$pkgdir"/usr/share/icons/hicolor/512x512/apps/
}

