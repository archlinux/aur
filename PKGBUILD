# Maintainer: Lily Anatia Wilson <hotaru at thinkindifferent dot net>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>

pkgname=wasi-sdk-bin
_pkgname=wasi-sdk
pkgver=14.0
_pkgver_major=14
pkgrel=1
pkgdesc="WASI-enabled WebAssembly C/C++ toolchain"
arch=('x86_64')
url="https://github.com/WebAssembly/wasi-sdk"
license=('Apache-2.0')
depends=('clang' 'lld')
options=('!strip')
source=(
    "https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${_pkgver_major}/wasi-sysroot-${pkgver}.tar.gz"
    "https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${_pkgver_major}/libclang_rt.builtins-wasm32-wasi-${pkgver}.tar.gz"
)
sha512sums=('e44a9cc02a5cd6dab22e345c9f4be529d79e5191f6b6bc462e032f7bd04b4161294430cfde235a66d503965f1d0154479cc8201152bcea1fb48c1a01289d94f9'
            '555c575c7188b81a2926046daec12721c1d2c1f67f1c06dcbafad0ac6fe417fd826de89f0d47699e9154e684ea6bae528595f164d945b0eb94ebe9708ea93b5c')

package() {
    _clang_version=$(clang --version | grep version | cut -d" " -f3)
    cd $srcdir
    mkdir -p "$pkgdir/opt/wasi-sdk" "$pkgdir/usr/lib/clang/${_clang_version}/"

    mv wasi-sysroot "$pkgdir/opt/wasi-sdk/"
    mv lib "$pkgdir/usr/lib/clang/${_clang_version}/"
}
# vim:set ts=2 sw=2 et:

