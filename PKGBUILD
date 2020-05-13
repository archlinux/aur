# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=arm
pkgver=1.0.0
pkgrel=1
pkgdesc="Armory CLI or better know as arm cli is a tool that let you render dinghyfiles offline."
arch=('x86_64')
url="https://github.com/armory-io/arm"
license=('Apache')
depends=('glibc')
makedepends=('go-pie')
source=("https://github.com/armory-io/arm/archive/$pkgver.zip")
sha512sums=('f611dc0561d9eb586843e791d219f25ec8c80f5651e14ce1367a1f757d9e46fa0ce31cbf8e0e314e0747ae04e2dfeaaca186f64a5dc23529ba9e0b4124ef4c02')

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
