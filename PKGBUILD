# Maintainer: dvjn <git@dvjn.dev>
pkgname=ears-llm-bin
pkgver=0.5.0 # x-release-please-version
pkgrel=1
pkgdesc="OpenAI-compatible transcript clean-up server for ears, backed by llama.cpp"
arch=('x86_64')
url="https://github.com/dvjn/ears"
license=('MIT')
# llama.cpp and ggml are built in statically; the GPU is used through Vulkan.
depends=('vulkan-icd-loader' 'gcc-libs' 'glibc')
optdepends=(
    'nvidia-utils: Vulkan driver for NVIDIA GPUs'
    'vulkan-radeon: Vulkan driver for AMD GPUs'
    'vulkan-intel: Vulkan driver for Intel GPUs'
)
provides=('ears-llm')
conflicts=('ears-llm')
options=('!debug')
install=ears-llm-bin.install
source=("$url/releases/download/v$pkgver/ears-llm-$pkgver-x86_64.tar.gz")
sha256sums=('197bf2cae676ce4e0ce71f430ae2908851a5eb3ecd9b8de1f7bd8995603cd2fc')

package() {
    cd "ears-llm-$pkgver-x86_64"
    install -Dm755 ears-llm "$pkgdir/usr/bin/ears-llm"
    install -Dm644 models.toml "$pkgdir/usr/share/ears-llm/models.toml"
    install -Dm644 ears-llm.service "$pkgdir/usr/lib/systemd/user/ears-llm.service"
    install -Dm644 env.example "$pkgdir/usr/share/doc/ears-llm/env.example"
    install -Dm644 README.md "$pkgdir/usr/share/doc/ears-llm/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
