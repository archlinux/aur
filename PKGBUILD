# Maintainer: Lily Anatia Wilson <hotaru at thinkindifferent dot net>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>

pkgname=wasi-sdk-bin
_pkgname=wasi-sdk
pkgver=12.0
_pkgver_major=12
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
sha512sums=('0dfbc250863f80d98638ad4cd4ccbf482c4a7ca91f1221e10ce5ee63bf4490c6f0a5f09d69a5e9000dc31c05439fece8638c486a3d85956b26cddd1f54dccb8f'
            '8297413cb44dd0a68528ea66515677d16c3af8ff5ac80a4d0c5dacd54ead32d316ec6fb7aee483bcef8b018a8558a2358e02a1fe1ec26f21426098aeb772346a')

package() {
    _clang_version=$(clang --version | grep version | cut -d" " -f3)
    cd $srcdir
    mkdir -p "$pkgdir/opt/wasi-sdk" "$pkgdir/usr/lib/clang/${_clang_version}/"

    mv wasi-sysroot "$pkgdir/opt/wasi-sdk/"
    mv lib "$pkgdir/usr/lib/clang/${_clang_version}/"
}
# vim:set ts=2 sw=2 et:

