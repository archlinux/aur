# Maintainer: tee < teeaur at duck dot com >
#pkgbase=wasmedge
_pkgname=WasmEdge
pkgname=(
    wasmedge-bin
    wasmedge-plugin-wasi-crypto
)
pkgver=0.13.4
pkgrel=1
pkgdesc="WasmEdge is a lightweight, high-performance, and extensible WebAssembly runtime"
arch=(x86_64 aarch64)
url="https://wasmedge.org"
_url="https://github.com/WasmEdge/WasmEdge"
license=("APACHE 2.0")
source=("$_url/raw/$pkgver/LICENSE")
source_x86_64=("$_url/releases/download/$pkgver/$_pkgname-$pkgver-manylinux2014_x86_64.tar.xz"
"$_url/releases/download/$pkgver/$_pkgname-plugin-wasi_crypto-$pkgver-manylinux2014_x86_64.tar.gz")
source_aarch64=("$_url/releases/download/$pkgver/$_pkgname-$pkgver-manylinux2014_aarch64.tar.xz"
"$_url/releases/download/$pkgver/$_pkgname-plugin-wasi_crypto-$pkgver-manylinux2014_aarch64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('512f95883ec03590fa9939bd28d3f08ab11f90a56058bfed6985fc8b2928672e'
                   '7f0b24ccc25e28cbde46d93498f1f58332b91fce12bbac010e7d4dd2b48f4f37')
sha256sums_aarch64=('4d26d5e12876ecb0d1b5295b3315a6d2f0defedebc927b312a47eeda30f0712a'
                    'c3085c365fd3bab2b64d1f7531aa14299e560b5fb9a91043176dc7afce09eb2b')

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
