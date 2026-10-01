# Maintainer: nuggocto <aur@sshmoi.com>
pkgname=orifude-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='A quiet, offline folding and ink puzzle game for the terminal'
arch=('x86_64' 'aarch64')
url='https://orifude.com'
license=('Apache-2.0')
options=('!strip')
source_x86_64=("https://github.com/nuggocto/orifude/releases/download/v1.1.1/orifude-$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('1866345217efeb6941067d4b2ea29aacad7d96605accbf2f39269b67ea563117')
source_aarch64=("https://github.com/nuggocto/orifude/releases/download/v1.1.1/orifude-$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('5f6e3dce4023f9c14cf37692fcd87886071547b349d415055cf063c837b81d8c')

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
