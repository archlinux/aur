# Maintainer: tee < teeaur at duck dot com >
#pkgbase=wasmedge
_pkgname=WasmEdge
pkgname=(
    wasmedge-bin
    wasmedge-plugin-wasi-crypto
)
pkgver=0.13.3
pkgrel=1
pkgdesc="WasmEdge is a lightweight, high-performance, and extensible WebAssembly runtime"
arch=(x86_64 aarch64)
url="https://wasmedge.org"
_url="https://github.com/WasmEdge/WasmEdge"
license=(APACHE)
source=("$_url/raw/$pkgver/LICENSE")
source_x86_64=("$_url/releases/download/$pkgver/$_pkgname-$pkgver-manylinux2014_x86_64.tar.xz"
"$_url/releases/download/$pkgver/$_pkgname-plugin-wasi_crypto-$pkgver-manylinux2014_x86_64.tar.gz")
source_aarch64=("$_url/releases/download/$pkgver/$_pkgname-$pkgver-manylinux2014_aarch64.tar.xz"
"$_url/releases/download/$pkgver/$_pkgname-plugin-wasi_crypto-$pkgver-manylinux2014_aarch64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('3bf7e84435ae09140d7c61f252684892ffca0e5b1c3a17757cbfc8c2e609ae0f'
                   'b39713775d903ebeb8fabb6a321cb863431c017ac378e9652cfc4e4c42d74107')
sha256sums_aarch64=('f734e0002481a76e26059dbb90f6adef5b63ff73fb0b7e2b0fa0fe944b3e355a'
                    '3d4ecc62069876333d8c1941e09196ee535709a94f0c30890654032aaff6a9f5')

package_wasmedge-bin() {
    provides=(wasmedge)
    conflicts=(wasmedge)
    install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/${_pkgname,,}/
    cd $_pkgname-$pkgver-Linux
    install -Dm755 bin/${_pkgname,,} -t $pkgdir/usr/bin/
    install -Dm755 bin/${_pkgname,,}c -t $pkgdir/usr/bin/
    install -Dm755 lib64/libwasmedge.so.0.0.3 -t $pkgdir/usr/lib/
    cp -d lib64/libwasmedge.so -t $pkgdir/usr/lib/
    cp -d lib64/libwasmedge.so.0 -t $pkgdir/usr/lib/
    install -D include/${_pkgname,,}/* -t $pkgdir/usr/include/
}

package_wasmedge-plugin-wasi-crypto() {
    pkgdesc='WasmEdge wasi crypto plugin'
    depends=(wasmedge)
    install -Dm755 libwasmedgePluginWasiCrypto.so -t $pkgdir/usr/lib/
}
