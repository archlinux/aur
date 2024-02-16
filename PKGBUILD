# Maintainer: MixusMinimax <maxi.barmetler@gmail.com>

pkgname=falsedotnet
pkgver=1.0.0alpha1
_pkgver=1.0.0-alpha.1
pkgrel=1
arch=('x86_64')
# https://github.com/MixusMinimax/falsedotnet/archive/refs/tags/v1.0.0-alpha.1.tar.gz
url='https://github.com/MixusMinimax/falsedotnet'
license=('MIT')
depends=('git' 'dotnet-runtime')
makedepends=('dotnet-sdk')
source=("$url/archive/v$_pkgver.tar.gz")
sha256sums=('fadcc64f35b824bfb9c71d88b66de8899052cdca419924868af1ecf3488ec2c4')

build() {
  cd "$pkgname-$_pkgver/FalseDotNet.Cli"
  MSBUILDDISABLENODEREUSE=1 dotnet publish \
    --configuration Release \
    --self-contained true \
    --runtime linux-x64 \
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
