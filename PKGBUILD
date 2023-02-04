# Maintainer: Mario Oenning <mo-son[at]mailbox[dot]org>
# Author: codic12 <https://github.com/codic12>

pkgname='worm'
pkgdesc="A floating, tag-based window manager written in Nim"
pkgver=0.3.2
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/codic12/worm"
license=('MIT')
makedepends=('nimble' 'nim' 'git')
depends=('xorg-server')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('6ff32ab5f93e58ee96a5add9c5f8489512b228f21b87d9f4de487d3824bc25e041a1e107f1380b8c2060de75df68fe758762cc4910afeef39710f9e412e5088d')

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
    
    # docs
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "docs/wormc.md" "$pkgdir/usr/share/doc/$pkgname/WORMC.md"
    
    # examples
    install -Dm755 "examples/rc" "$pkgdir/usr/share/doc/$pkgname/examples/rc"
    install -Dm644 "examples/sxhkdrc" "$pkgdir/usr/share/doc/$pkgname/examples/sxhkdrc"
    install -Dm755 "examples/jgmenu_run" "$pkgdir/usr/share/doc/$pkgname/examples/jgmenu_run"
}
