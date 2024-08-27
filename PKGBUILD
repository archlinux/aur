# Maintainer: Mario Oenning <mo-son[at]mailbox[dot]org>
# Author: codic12 <https://github.com/codic12>

pkgname='worm'
pkgdesc="A floating, tag-based window manager written in Nim"
pkgver=0.3.3
pkgrel=2
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/codic12/worm"
license=('MIT')
makedepends=('nimble' 'nim' 'git')
depends=('xorg-server')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('68f7269c5a788623e1422045b33b04cf31ac3d017c69cbd0ffdff555fce10b2b4477d089f4f1bff997c8ad1bb8defd6142782f0284592be86712199d044301d3')

build() {
    cd "$pkgname-$pkgver"
    nimble -y build -d:release --gc:arc --passC:"-Wno-error=incompatible-pointer-types"
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
