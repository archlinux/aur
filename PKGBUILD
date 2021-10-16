# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=koka

pkgname=koka-bin
pkgver=2.3.2
pkgrel=1
pkgdesc="Koka: a function-oriented language with effect inference"
arch=('x86_64')
url="https://github.com/koka-lang/koka"
license=('Apache')
options=('!strip')
depends=('gcc' 'make')
optdepends=(
  'clang: for C backend compiler'
  'nodejs: for JavaScript target'
  'emscripten: for WebAssembly target'
  'wasmtime: for running WebAssembly modules'
  'mono: for C# target'
)
provides=('koka')
conflicts=('koka')
source=(
  "https://github.com/koka-lang/koka/releases/download/v${pkgver}/koka-v${pkgver}-linux-x64.tar.gz"
)
noextract=("koka-v${pkgver}-linux-x64.tar.gz")
sha256sums=(
  'd9d4527e3cdd960545184d0b3eaa285753f996d2674c95edee128443d15c2521'
)

package() {
  install -d "${pkgdir}/usr"
  tar -xzf koka-v${pkgver}-linux-x64.tar.gz -C "${pkgdir}/usr"

  # Permission fix
  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  chmod +x "${pkgdir}/usr/bin/koka"
  chown -R root:root "${pkgdir}"
}
