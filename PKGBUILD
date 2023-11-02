# Maintainer: CoolandonRS <contact @ numra.net>
pkgname=dynknock
_slnname=dynknock
_projname=Dynknock_Client
pkgver=1.1.0
pkgrel=2
pkgdesc="Port knocker using a periodically changing sequence"
arch=('x86_64')
url='https://github.com/CoolandonRS/dynknock'
license=("GPL3")
depends=("gcc-libs" "zlib" "glibc")
makedepends=("dotnet-sdk>7.0.0" "subversion")
source=("dynknock::svn+https://github.com/CoolandonRS/$_slnname/tags/v$pkgver/$_projname")
sha256sums=('SKIP')

build() {
  cd $pkgname
  MSBUILDDISABLENODEREUSE=1 dotnet publish --configuration Release --self-contained true --runtime linux-x64 -p:PublishTrimmed=true --output ../$pkgname ./$_projname.csproj
}

package() {
  install -d $pkgdir/usr/{bin,lib}
  cp -r $pkgname "$pkgdir/usr/lib/"
  ln -s "/usr/lib/$pkgname/$_projname" "$pkgdir/usr/bin/$pkgname"
}
