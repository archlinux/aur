pkgname=container2wasm-git
pkgver=v0.8.2.r14.gb8f9f4a
pkgrel=1
pkgdesc="Convert OCI container images to WASM modules (c2w binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/container2wasm/container2wasm"
license=('Apache-2.0')
depends=('buildah' 'skopeo')
makedepends=('go' 'git' 'make')
optdepends=('wasmtime: Recommended WASM runtime'
            'wasmer: Alternative WASM runtime'
            'wamr-git: Alternative WASM runtime (from AUR)')
provides=('container2wasm')
conflicts=('container2wasm')
source=("git+https://github.com/container2wasm/container2wasm.git")
sha256sums=('SKIP')

# Corrected cd command
pkgver() {
  cd "container2wasm"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# Corrected cd command
build() {
  cd "container2wasm"
  make
}

# Corrected cd command
package() {
  cd "container2wasm"
  install -Dm755 "out/c2w" "${pkgdir}/usr/bin/c2w"
  install -Dm755 "out/c2w-net" "${pkgdir}/usr/bin/c2w-net"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
