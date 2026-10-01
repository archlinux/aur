# Maintainer: nuggocto <aur@sshmoi.com>
pkgname=orifude-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='A quiet, offline folding and ink puzzle game for the terminal'
arch=('x86_64' 'aarch64')
url='https://orifude.com'
license=('Apache-2.0')
options=('!strip')
source_x86_64=("https://github.com/nuggocto/orifude/releases/download/v1.1.0/orifude-$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('eea89c8fd5862a365b730a998ffd471446f9134cd4b5f1904fe874288cfcd8ed')
source_aarch64=("https://github.com/nuggocto/orifude/releases/download/v1.1.0/orifude-$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('7b0c9aae29d5674e9213472bc6174aaf350937d2262f39b10dedfbe1b484b66d')

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
