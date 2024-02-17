# Maintainer: MixusMinimax <maxi.barmetler@gmail.com>

pkgname=falsedotnet
pkgver=1.0.0
_pkgver=1.0.0
pkgrel=1
pkgdesc="An interpreter and compiler for the esoteric programming language False, implemented using .NET Core"
arch=('x86_64')
url='https://github.com/MixusMinimax/falsedotnet'
license=('MIT')
depends=('git' 'dotnet-runtime')
makedepends=('dotnet-sdk')
optdepends=('nasm: for assembling false programs')
source=("$url/archive/v$_pkgver.tar.gz")
sha256sums=('27a36bd5613811ea64e912ed5c4d69566d96d82921958bc8028370d6e1404433')

build() {
  cd "$pkgname-$_pkgver/FalseDotNet.Cli"
  MSBUILDDISABLENODEREUSE=1 dotnet publish \
    --configuration Release \
    --self-contained true \
    --runtime linux-x64 \
    -p:Version=$_pkgver \
    -p:PublishTrimmed=true \
    --output ../$pkgname \
    ./FalseDotNet.Cli.csproj
}

package() {
  cd "$pkgname-$_pkgver"

  install -d $pkgdir/usr/{bin,lib}
  cp -r $pkgname "$pkgdir/usr/lib/"
  ln -s "/usr/lib/$pkgname/FalseDotNet.Cli" "$pkgdir/usr/bin/$pkgname"
}
