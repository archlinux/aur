# Maintainer: Andrew Arendt <andrewarendt at gmail dot com>

pkgname=ttypo-bin
_pkgname=ttypo
pkgver=0.1.19
pkgrel=1
pkgdesc="Terminal-based typing test (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/drewja/ttypo"
license=('MIT')
provides=("ttypo=$pkgver")
conflicts=('ttypo')

# Archive naming matches cargo-dist's default output:
#   {app}-{target_triple}.tar.xz
# Contents:
#   {app}-{target_triple}/{app}
#   {app}-{target_triple}/README.md
#   {app}-{target_triple}/LICENSE.md
_release_url="$url/releases/download/v$pkgver"
source_x86_64=("$_release_url/$_pkgname-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("$_release_url/$_pkgname-aarch64-unknown-linux-gnu.tar.xz")

# Populate via `updpkgsums` after each release.
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    local _dir="$_pkgname-$CARCH-unknown-linux-gnu"
    # cargo-dist uses the exact target triple, so translate Arch's CARCH.
    case "$CARCH" in
        x86_64)  _dir="$_pkgname-x86_64-unknown-linux-gnu" ;;
        aarch64) _dir="$_pkgname-aarch64-unknown-linux-gnu" ;;
    esac

    install -Dm0755 -t "$pkgdir/usr/bin/" "$_dir/$_pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname/" "$_dir/LICENSE.md"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" "$_dir/README.md"
}
