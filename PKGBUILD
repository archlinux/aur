# Maintainer: Zine Yu zine.xlws@gmail.com

pkgname=buck2-bin
pkgver=2025.11.15
pkgrel=1
pkgdesc="A large-scale build system from Meta, developed in Rust"
arch=('x86_64' 'aarch64' 'riscv64gc')
url="https://github.com/facebook/buck2"
license=('Apache' 'MIT')
depends=('zstd')
options=('!strip')
provides=('buck2')

_formatted_date() {
    echo "$pkgver" | sed 's/\./-/g'
}

source_x86_64=("buck2-${pkgver}-${CARCH}.zst::https://github.com/facebook/buck2/releases/download/$(_formatted_date)/buck2-x86_64-unknown-linux-gnu.zst")
source_aarch64=("buck2-${pkgver}-${CARCH}.zst::https://github.com/facebook/buck2/releases/download/$(_formatted_date)/buck2-aarch64-unknown-linux-gnu.zst")
source_riscv64gc=("buck2-${pkgver}-${CARCH}.zst::https://github.com/facebook/buck2/releases/download/$(_formatted_date)/buck2-riscv64gc-unknown-linux-gnu.zst")

sha256sums_x86_64=('66abc16e0da33f690e10fab18435ffeee55fa66ebbb66748b63ee2f03ec2578d')
sha256sums_aarch64=('8440b92d0fc8a7c79cb47f82e4352b96b7a3f6e32d4abef72518ec6d9f5b39ca')
sha256sums_riscv64gc=('df73e577b4bcec358cf7396e1fe9a4753c00e6c023084d4345d20a75e54bb693')


case "$CARCH" in
    x86_64)
        _platform="x86_64-unknown-linux-gnu"
        ;;
    aarch64)
        _platform="aarch64-unknown-linux-gnu"
        ;;
    riscv64gc)
        _platform="riscv64gc-unknown-linux-gnu"
        ;;
esac


package() {
    cd "$srcdir"
    zstd -d -f "buck2-${pkgver}-${CARCH}.zst" -c >buck2
    install -Dm755 buck2 "$pkgdir/usr/bin/buck2"
}
