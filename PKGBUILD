# Maintainer: tee < teeaur at duck dot com >
pkgbase=wasmedge
_pkgname=WasmEdge
pkgname=(
    wasmedge-bin
    wasmedge-plugin-wasi-crypto
)
pkgver=0.13.2
pkgrel=1
pkgdesc="WasmEdge is a lightweight, high-performance, and extensible WebAssembly runtime"
arch=(x86_64 aarch64)
url="https://wasmedge.org"
_url="https://github.com/WasmEdge/WasmEdge"
license=(APACHE)
source=("$_url/raw/master/LICENSE")
source_x86_64=("$_url/releases/download/$pkgver/$_pkgname-$pkgver-manylinux2014_x86_64.tar.xz"
"$_url/releases/download/$pkgver/$_pkgname-plugin-wasi_crypto-$pkgver-manylinux2014_x86_64.tar.gz")
source_aarch64=("$_url/releases/download/$pkgver/$_pkgname-$pkgver-manylinux2014_aarch64.tar.xz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('5b7c3ec27ffc63d908fe396afe39b432365937af96776ab64629c500e831ab42'
                   '1449ee64da40f08b32c4072cd67abbebffea1e59c9326ec5688f0277ed6bc9ff')
sha256sums_aarch64=('7e71dc3a3cf454b5eaf052720f2b3fac71e0a9310b0ba76dfce2762c7036a904')

package_wasmedge-bin() {
    provides=(wasmedge)
    conflicts=(wasmedge)
    install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/${_pkgname,,}/
    cd $_pkgname-$pkgver-Linux
    install -Dm755 bin/$pkgbase -t $pkgdir/usr/bin/
    install -Dm755 lib64/libwasmedge.so.0.0.3 -t $pkgdir/usr/lib/
    cp -d lib64/libwasmedge.so -t $pkgdir/usr/lib/
    cp -d lib64/libwasmedge.so.0 -t $pkgdir/usr/lib/
    install -D include/$pkgbase/* -t $pkgdir/usr/include/
}

package_wasmedge-plugin-wasi-crypto() {
    pkgdesc='WasmEdge wasi crypto plugin'
    depends=(wasmedge)
    install -Dm755 libwasmedgePluginWasiCrypto.so -t $pkgdir/usr/lib/
}
