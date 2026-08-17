# Maintainer: CodeTease
pkgname=zzzsleep-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A fancy sleep command written in Rust 💤"
url="https://github.com/CodeTease/zzz"
license=('MIT')
options=(!strip !debug)
provides=('zzzsleep')
conflicts=('zzzsleep')
arch=()
arch+=('x86_64')
source_x86_64=("${url}/releases/download/v${pkgver}/zzz-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('26bcbf3a749911d9ed84831f52ac8dfa39840f313056df09f4e80aa9d6c4f1b2')
arch+=('aarch64')
source_aarch64=("${url}/releases/download/v${pkgver}/zzz-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('42d5bb60fcdff0bb59f83533c6cda8403822470050f8fc3ebcc0a0b63d69eda7')

package() {
    local bin_path=$(find "$srcdir" -type f -name "zzz" -executable | head -n 1)

    if [ -n "$bin_path" ]; then
        install -Dm755 "$bin_path" "${pkgdir}/usr/bin/zzz"
    else
        echo "Error: Binary zzz not found in $srcdir"
        return 1
    fi

    local license_path=$(find "$srcdir" -type f -name "LICENSE" | head -n 1)
    if [ -n "$license_path" ]; then
        install -Dm644 "$license_path" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}