# Maintainer: Mario Oenning <mo-son[at]mailbox[dot]org>
# Author: codic12 <https://github.com/codic12>

pkgname='worm'
pkgdesc="A floating, tag-based window manager written in Nim"
pkgver=0.1.0
pkgrel=1
arch=('x86_64')
url="https://github.com/codic12/worm"
license=('MIT')
makedepends=('nimble' 'nim')
depends=('xorg-server')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('116c3370d993ff0d31b6f987bc257d204d72dd5ac614c3d06efd71a624a91df1')

build() {
    cd "$pkgname-$pkgver"
    nimble -y build -d:release --gc:arc
}

package() {
    cd "$pkgname-$pkgver"

    # bin
    install -D -m755 "worm" "$pkgdir/usr/bin/worm"
    install -D -m755 "wormc" "$pkgdir/usr/bin/wormc"

    # license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # X session file
    install -Dm644 "assets/worm.desktop" "$pkgdir/usr/share/xsessions/worm.desktop"
}
