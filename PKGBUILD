# Maintainer: dvjn <git@dvjn.dev>
pkgname=ears-stt-bin
pkgver=0.5.0 # x-release-please-version
pkgrel=1
pkgdesc="OpenAI-compatible speech-to-text server for ears, backed by whisper.cpp"
arch=('x86_64')
url="https://github.com/dvjn/ears"
license=('MIT')
# whisper.cpp and ggml are built in statically; the GPU is used through Vulkan.
depends=('vulkan-icd-loader' 'ffmpeg' 'gcc-libs' 'glibc')
optdepends=(
    'nvidia-utils: Vulkan driver for NVIDIA GPUs'
    'vulkan-radeon: Vulkan driver for AMD GPUs'
    'vulkan-intel: Vulkan driver for Intel GPUs'
)
provides=('ears-stt')
conflicts=('ears-stt')
options=('!debug')
install=ears-stt-bin.install
source=("$url/releases/download/v$pkgver/ears-stt-$pkgver-x86_64.tar.gz")
sha256sums=('ea498fa863eb552362b9340dc686d14b5b1b0b7b6b336f5635a9d246d53b8dc0')

package() {
    cd "ears-stt-$pkgver-x86_64"
    install -Dm755 ears-stt "$pkgdir/usr/bin/ears-stt"
    install -Dm644 ears-stt.service "$pkgdir/usr/lib/systemd/user/ears-stt.service"
    install -Dm644 env.example "$pkgdir/usr/share/doc/ears-stt/env.example"
    install -Dm644 README.md "$pkgdir/usr/share/doc/ears-stt/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
