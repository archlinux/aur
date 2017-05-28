#Maintainer: Lúcio Rubens <luciorubeens@gmail.com>
_npmname=ArkClient
_appname=arkclient
pkgname=ark-desktop
pkgver=1.2.2
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
  "56872f135d6e0b86adfdd3d72a6c2c4880750c6c"
  "687295fc60638fdd828646e7fc44eaf38eca3cd0"
  "66dadafaa8f6c03c1790a9fa1acf33ec0bfeaa64"
)

package() {
  cd "$srcdir/$_npmname-$pkgver"

  install -d $pkgdir/{opt/$pkgname,usr/bin}
  cp -a * $pkgdir/opt/$pkgname
  rm $pkgdir/opt/$pkgname/LICENSE*
  ln -s /opt/$pkgname/$_appname $pkgdir/usr/bin/$_appname

  install -Dm644 "$srcdir/$_appname.desktop" "$pkgdir/usr/share/applications/$_appname.desktop"
  install -Dm644 "$srcdir/$_appname.png" "$pkgdir/usr/share/pixmaps/$_appname.png"

  chmod -R ugo+rX $pkdir/opt
}
