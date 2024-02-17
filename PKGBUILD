# Maintainer: MixusMinimax <maxi.barmetler@gmail.com>

pkgname=falsedotnet
pkgver=1.0.0alpha1
_pkgver=1.0.0-alpha.1
pkgrel=1
pkgdesc="An interpreter and compiler for the esoteric programming language False, implemented using .NET Core"
arch=('x86_64')
url='https://github.com/MixusMinimax/falsedotnet'
license=('MIT')
depends=('git' 'dotnet-runtime')
makedepends=('dotnet-sdk')
optdepends=('nasm: for assembling false programs')
source=("$url/archive/v$_pkgver.tar.gz")
sha256sums=('fadcc64f35b824bfb9c71d88b66de8899052cdca419924868af1ecf3488ec2c4')

build() {
  cd "$pkgname-$_pkgver/FalseDotNet.Cli"
  MSBUILDDISABLENODEREUSE=1 dotnet publish \
    --configuration Release \
    --self-contained true \
    --runtime linux-x64 \
    -p:Version=$_pkgver \
    --output ../$pkgname \
    ./FalseDotNet.Cli.csproj
}

package() {
  cd "$pkgname-$_pkgver"

  install -d $pkgdir/usr/{bin,lib}
  cp -r $pkgname "$pkgdir/usr/lib/"
  ln -s "/usr/lib/$pkgname/FalseDotNet.Cli" "$pkgdir/usr/bin/$pkgname"
}
