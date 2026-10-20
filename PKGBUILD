# Maintainer: dvjn <git@dvjn.dev>
pkgname=ears-stt-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="OpenAI-compatible speech-to-text server for ears, backed by whisper.cpp"
arch=('x86_64')
url="https://github.com/dvjn/ears"
license=('MIT')
# Built against these exact versions (see built-with.txt in the release):
# whisper.cpp's C structs change between releases without a soname bump, so
# a newer whisper-cpp waits for the next ears-stt release.
depends=('whisper-cpp=1.9.5' 'ggml=0.26.0' 'ffmpeg' 'gcc-libs' 'glibc')
optdepends=(
    'ggml-cuda: NVIDIA GPU acceleration'
    'ggml-vulkan: Vulkan GPU acceleration'
)
provides=('ears-stt')
conflicts=('ears-stt')
options=('!debug')
install=ears-stt-bin.install
source=("$url/releases/download/v$pkgver/ears-stt-$pkgver-x86_64.tar.gz")
sha256sums=('f1af76b3d7f1b73448b2312e6659a38b7216a81c2ed0ceb38b8a7ec432bace54')

package() {
    cd "ears-stt-$pkgver-x86_64"
    install -Dm755 ears-stt "$pkgdir/usr/bin/ears-stt"
    install -Dm644 ears-stt.service "$pkgdir/usr/lib/systemd/user/ears-stt.service"
    install -Dm644 env.example "$pkgdir/usr/share/doc/ears-stt/env.example"
    install -Dm644 README.md "$pkgdir/usr/share/doc/ears-stt/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
