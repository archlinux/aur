# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=arm
pkgver=1.6.0
pkgrel=1
pkgdesc="Armory CLI or better know as arm cli is a tool that let you render dinghyfiles offline."
arch=('x86_64')
url="https://github.com/armory-io/arm"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.zip::https://github.com/armory-io/arm/archive/$pkgver.zip")
sha512sums=('e078593fd2048346f08352470493d81f7e7afe5319a749b746e24bcd0ea4955f312a946c94d5dcc228b4b06c9c0681d1ff81083dd7c49501c0abf5858d695d1d')

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
