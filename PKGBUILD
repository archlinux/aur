# Maintainer: LeTuR <magicletur@protonmail.com>
pkgname=thurbox-bin
pkgver=0.92.1
pkgrel=1
pkgdesc="TUI for orchestrating multiple coding-agent CLI sessions in persistent tmux panels (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Thurbeen/thurbox"
license=('MIT')
# Uses the statically-linked musl release tarball, so only the runtime
# helpers tmux/git are needed.
depends=('tmux' 'git')
provides=('thurbox')
conflicts=('thurbox')
# Release binaries are already stripped; skip strip/debug to avoid empty -debug pkg.
options=('!strip' '!debug')
# The release tarball ships the binaries but not LICENSE, so fetch it separately.
source=("thurbox-$pkgver.tar.gz::https://github.com/Thurbeen/thurbox/releases/download/v$pkgver/thurbox-v$pkgver-${CARCH}-unknown-linux-musl.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/Thurbeen/thurbox/v$pkgver/LICENSE")
sha256sums=('fd5164c19ee96c43ae1092cd17bb48d78696b1d6f1a90d7e4fa5c2d014c7a410'
            '6c24e78d9603d3f074127a789b3c913ea7b5f18900816af16194f7abbef9275e')

package() {
    # The tarball may also contain a legacy thurbox-mcp binary; we install
    # only the maintained binaries.
    install -Dm0755 -t "$pkgdir/usr/bin/" thurbox thurbox-cli
    install -Dm0644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
