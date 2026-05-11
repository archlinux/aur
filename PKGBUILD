# Maintainer: Entar <akulagin088@gmail.com>
pkgname=mawtrix
_pkgname_orig=Mawtrix
pkgver=0.8
pkgrel=1
pkgdesc="Simple [matrix] TUI i made on C# because i was very bored. I wanted to practice and check out how hard it would be to make a Matrix client, turns out, it's not that hard after all."
arch=('x86_64')
url=""https://github.com/Entarno54/Mawtrix
license=('MIT')
depends=('dotnet-runtime')
makedepends=('dotnet-sdk')
source=("https://github.com/Entarno54/Mawtrix/archive/refs/tags/v${pkgver}.zip")
sha256sums=('SKIP')

build() {  
  cd "$_pkgname_orig-$pkgver"
  
  dotnet publish -c Release --property:PublishDir="$srcdir/publish/" --self-contained false
}

package() {
  cd "$_pkgname_orig-$pkgver"
  
  # Create directory
  install -d "$pkgdir/opt/$pkgname"
  
  # Copy published files
  cp -r "$srcdir/publish/"* "$pkgdir/opt/$pkgname"
  
  # Create symlink to /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$_pkgname_orig" "$pkgdir/usr/bin/$pkgname"
}
