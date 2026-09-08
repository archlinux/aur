# Maintainer: nuggocto <aur@sshmoi.com>
pkgname=orifude-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='A quiet, offline folding and ink puzzle game for the terminal'
arch=('x86_64' 'aarch64')
url='https://orifude.com'
license=('Apache-2.0')
options=('!strip')
source_x86_64=("https://github.com/nuggocto/orifude/releases/download/v1.0.1/orifude-$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('12ddd273f7d01fbd765572217e6d5291ee3e5a5089c075b7535f4029f68de091')
source_aarch64=("https://github.com/nuggocto/orifude/releases/download/v1.0.1/orifude-$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('46244f37c5eafb6e43f7d341506033cbcdf50b16c652562afbda75d26099115b')

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
