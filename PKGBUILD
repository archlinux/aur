# Maintainer: nuggocto <aur@sshmoi.com>
pkgname=orifude-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='A quiet, offline folding and ink puzzle game for the terminal'
arch=('x86_64' 'aarch64')
url='https://orifude.com'
license=('Apache-2.0')
options=('!strip')
source_x86_64=("https://github.com/nuggocto/orifude/releases/download/v1.0.0/orifude-$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('c2e1fe770643160369c3427dffa46afaae6e147155d2177b18ebd0ab5a4537fc')
source_aarch64=("https://github.com/nuggocto/orifude/releases/download/v1.0.0/orifude-$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('3010a16d792c9a41e26a3954e07b9111448a5a7f71e3ae3557914384b375ddaf')

package() {
    local target
    case "$CARCH" in
        x86_64) target=x86_64-unknown-linux-musl ;;
        aarch64) target=aarch64-unknown-linux-musl ;;
        *) return 1 ;;
    esac
    # makepkg supplies srcdir and pkgdir.
    # shellcheck disable=SC2154
    local source_dir="$srcdir/orifude-$pkgver-$target"
    # shellcheck disable=SC2154
    install -Dm755 "$source_dir/orifude" "$pkgdir/usr/bin/orifude"
    install -Dm644 "$source_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$source_dir/README.txt" "$pkgdir/usr/share/doc/$pkgname/README.txt"
}
