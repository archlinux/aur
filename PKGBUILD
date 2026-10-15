# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=codex-auth
pkgver=0.3.1
pkgrel=1
pkgdesc="A CLI tool to switch and manage Codex accounts"
arch=('x86_64' 'aarch64')
url="https://github.com/Loongphy/codex-auth"
license=('MIT')
depends=('glibc')
makedepends=('git' 'zig')
optdepends=('openai-codex: adding accounts easier')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha512sums=('c9a7ea4f57e19b6613947a85a2d3f3f742d43225b9248d16bdd5d352556dc8112ad57d748540f5b6e72065700cc4a92911f078e8fd6fb6e84cac34f0ec5e7d28')

prepare() {
  mkdir -p "${pkgname}/build"
}

build() {
  cd "${pkgname}"
  zig build -Doptimize=ReleaseSafe
}

package() {
  cd "${pkgname}"

  install -Dm755 zig-out/bin/codex-auth "${pkgdir}/usr/bin/codex-auth"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
