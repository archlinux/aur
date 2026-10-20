# Maintainer: dvjn <git@dvjn.dev>
pkgname=ears-llm-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="OpenAI-compatible transcript clean-up server for ears, backed by llama.cpp"
arch=('x86_64')
url="https://github.com/dvjn/ears"
license=('MIT')
# Built against these exact versions (see built-with.txt in the release):
# llama.cpp's C structs change between releases without a soname bump, so
# a newer llama-cpp waits for the next ears-llm release.
depends=('llama-cpp=0.6.0' 'ggml=0.26.0' 'gcc-libs' 'glibc')
optdepends=(
    'ggml-cuda: NVIDIA GPU acceleration'
    'ggml-vulkan: Vulkan GPU acceleration'
)
provides=('ears-llm')
conflicts=('ears-llm')
options=('!debug')
install=ears-llm-bin.install
source=("$url/releases/download/v$pkgver/ears-llm-$pkgver-x86_64.tar.gz")
sha256sums=('8a8496d6c4ec417d3030791cefe9734027504acc9ff678f990ea1652ee8b429c')

package() {
    cd "ears-llm-$pkgver-x86_64"
    install -Dm755 ears-llm "$pkgdir/usr/bin/ears-llm"
    install -Dm644 models.toml "$pkgdir/usr/share/ears-llm/models.toml"
    install -Dm644 ears-llm.service "$pkgdir/usr/lib/systemd/user/ears-llm.service"
    install -Dm644 env.example "$pkgdir/usr/share/doc/ears-llm/env.example"
    install -Dm644 README.md "$pkgdir/usr/share/doc/ears-llm/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
