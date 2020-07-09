# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=arm
pkgver=1.4.0
pkgrel=1
pkgdesc="Armory CLI or better know as arm cli is a tool that let you render dinghyfiles offline."
arch=('x86_64')
url="https://github.com/armory-io/arm"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("https://github.com/armory-io/arm/archive/$pkgver.zip")
sha512sums=('bfed39a8369fa5ca4cfee8168d63b4b43a27e2be7f0a94c7ab7e02e386efb1f8cef210c1f5bc5ada1d524b0fe62ebf6a8aad7aeea6ed8f6eb4d439e55c4e0cec')

build() {
    cd $pkgname-$pkgver
    go build \
        -trimpath \
        -ldflags "-X github.com/armory-io/arm/cmd.enableVersionCheck=offbydefault -X github.com/armory-io/arm/cmd.currentVersion=$PKGVER -extldflags ${LDFLAGS}" \
        -o $pkgname .
}

package() {
    cd $pkgname-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
