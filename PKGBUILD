# Maintainer: Manuel Schneider <kontakt at brainyxs dot com>
pkgname=twitchleecher-dx
_pkgname=TwitchLeecher-Dx
pkgdesc="A simple download tool for Twitch streams"
pkgver=3.9.0
_pkgver=3.9.0
pkgrel=1
arch=('x86_64')
url='https://github.com/schneidermanuel/TwitchLeecher-Dx'
license=("MIT")
depends=("icu" "ffmpeg")
makedepends=("dotnet-sdk-bin")
options=("staticlibs")
source=("$url/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('ebec6235f2cfcb7483c563c0c45f7d8edc2368f0365307014cc08b0279f82c16')

build() {
  cd "$_pkgname-$_pkgver/TwitchLeecher/TwitchLeecher"
  MSBUILDDISABLENODEREUSE=1 dotnet publish \
    --configuration Release \
    --self-contained true \
    --runtime linux-x64 \
    -p:PublishTrimmed=false \
    --output ../../$pkgname \
    ./TwitchLeecher.csproj
}

package() {
  cd "$_pkgname-$_pkgver"

  install -d $pkgdir/usr/{bin,lib}
  install -d $pkgdir/usr/share/{pixmaps,applications}
  cp -r $pkgname "$pkgdir/usr/lib/"
  ln -s "/usr/lib/$pkgname/TwitchLeecher" "$pkgdir/usr/bin/$pkgname"
  cp TwitchLeecher/Resources/Images/TL_Icon.png "$pkgdir/usr/share/pixmaps/twitchleecher-dx.png"
  cp twitchleecher-dx.desktop "$pkgdir/usr/share/applications/twitchleecher-dx.desktop"
}
