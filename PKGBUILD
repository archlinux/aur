#Maintainer: Lúcio Rubens <luciorubeens@gmail.com>
_npmname=ArkClient
_appname=arkclient
pkgname=ark-desktop
pkgver=1.4.3
pkgrel=1
pkgdesc="Multi Platform Ark Lite Client"
arch=(any)
url="https://github.com/ArkEcosystem/ark-desktop"
license=(MIT)
depends=('nodejs' 'electron')
makedepends=('npm')
checkdepends=()
optdepends=()
provides=()

options=()
install=
source=(
  "https://github.com/ArkEcosystem/$pkgname/releases/download/{$pkgver}/$_npmname-Linux-${pkgver}.tar.xz"
  "$_appname.desktop"
  "$_appname.png"
)
sha1sums=(
  "945c04d6124eb2eb11ba547f0ac9318d112ece12"
  "687295fc60638fdd828646e7fc44eaf38eca3cd0"
  "77c1f8707a779be883283150732d3477709af7da"
)

package() {
  cd "$srcdir/$_npmname-$pkgver"

  install -d $pkgdir/{opt/$pkgname,usr/bin}
  cp -a * $pkgdir/opt/$pkgname
  rm $pkgdir/opt/$pkgname/LICENSE*
  ln -s /opt/$pkgname/$_appname $pkgdir/usr/bin/$_appname

  install -Dm644 "$srcdir/$_appname.desktop" "$pkgdir/usr/share/applications/$_appname.desktop"
  install -Dm644 "$srcdir/$_appname.png" "$pkgdir/usr/share/pixmaps/$_appname.png"

  chmod -R ugo+rX $pkgdir/opt
}
