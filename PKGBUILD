# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=crispasr
pkgver=0.6.11
pkgrel=1
pkgdesc="Multilingual speech-to-text and text-to-speech engine with many ASR and TTS backends"
arch=('x86_64')
url="https://github.com/CrispStrobe/CrispASR"
license=('MIT')
depends=('gcc-libs' 'glibc' 'vulkan-icd-loader')
makedepends=('cmake' 'shaderc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('60a1f6f82bd4fb6c36eb14492f7bcb8ea3895729d8f3fbd5a4d436c0ee158878')

build() {
    cd "CrispASR-$pkgver"

    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=OFF \
        -DGGML_VULKAN=ON

    cmake --build build
}

package() {
    cd "CrispASR-$pkgver"

    install -Dm755 build/bin/crispasr "$pkgdir/usr/bin/crispasr"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
