# Maintainer: CodeTease
pkgname=zzzsleep-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A fancy sleep command written in Rust 💤"
url="https://github.com/CodeTease/zzz"
license=('MIT')
options=(!strip !debug)
provides=('zzzsleep')
conflicts=('zzzsleep')
arch=()
arch+=('x86_64')
source_x86_64=("${url}/releases/download/v${pkgver}/zzs-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('416bb58efc8b98b56e4c2ca2337ac02d98e53336f545ac304a40cd47614307ca')
arch+=('aarch64')
source_aarch64=("${url}/releases/download/v${pkgver}/zzs-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('582931697cc6a8753d0d9d98ce8fe0d76ace5963476017d81eaf48aec8b74217')

package() {
    local bin_path=$(find "$srcdir" -type f -name "zzs" -executable | head -n 1)

    if [ -n "$bin_path" ]; then
        install -Dm755 "$bin_path" "${pkgdir}/usr/bin/zzs"
    else
        echo "Error: Binary zzs not found in $srcdir"
        return 1
    fi

    local license_path=$(find "$srcdir" -type f -name "LICENSE" | head -n 1)
    if [ -n "$license_path" ]; then
        install -Dm644 "$license_path" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}