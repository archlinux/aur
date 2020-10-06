# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=arm
pkgver=1.8.0
pkgrel=1
pkgdesc="Armory CLI or better know as arm cli is a tool that let you render dinghyfiles offline."
arch=('x86_64')
url="https://github.com/armory-io/arm"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.zip::https://github.com/armory-io/arm/archive/$pkgver.zip")
sha512sums=('7d93b18133cd45ac5aa5ae93afb55d32c0caa57ae67d8daf04d9300425d447a9dc1cfae9f3e46d21e0e178870be3b9a7d7e347ed743ed6ca2ad7f6a1e0a1213a')

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
