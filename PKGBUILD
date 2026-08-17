# Maintainer: CodeTease
pkgname=zzz-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A fancy sleep command written in Rust 💤"
url="https://github.com/CodeTease/zzz"
license=('MIT')
options=(!strip !debug)
provides=('zzz')
conflicts=('zzz')
arch=()
arch+=('x86_64')
source_x86_64=("${url}/releases/download/v${pkgver}/zzz-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ac73dba0b8cb32f82e0f7572ef1b12861f690b4aded16fcdeb0588c01735a8e6')
arch+=('aarch64')
source_aarch64=("${url}/releases/download/v${pkgver}/zzz-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('4f10da3532bf9af37eaabf2432b5fa56d25f565a85834b88f3883c4a99f85ada')

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