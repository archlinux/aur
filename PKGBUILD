# Maintainer: aquova <mail at aquova dot net>

pkgname=stardrop
_pkgname=Stardrop
pkgver=1.2.1
pkgrel=1
pkgdesc='An open-source, cross-platform mod manager for Stardew Valley'
url='https://github.com/Floogen/Stardrop'
arch=("x86_64")
license=("GPL3")
depends=('dotnet-runtime-7.0')
makedepends=('dotnet-sdk-7.0')
source=(
    "${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    '39fb06ed5cbfc80c80b8f86cea56ddd575d604890fff4df93d601e62b80d88b9'
)

build() {
    cd $_pkgname-$pkgver
    dotnet publish $_pkgname -c Release -o out
}

package() {
    mkdir -p $pkgdir/opt/$pkgname
    mkdir -p $pkgdir/usr/bin

    cd $srcdir/$_pkgname-$pkgver/out
    cp -a * $pkgdir/opt/$pkgname
    ln -sf $pkgdir/opt/$pkgname/$_pkgname $pkgdir/usr/bin/$pkgname
}
