# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=kdash
pkgver=0.4.7
pkgrel=1
pkgdesc='A simple and fast dashboard for Kubernetes'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://kdash.cli.rs/'
license=('MIT')
depends=('gcc-libs' 'libxcb')
makedepends=('python' 'rust')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdash-rs/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d8c1b7c2df300c65bd6e67a9fef1edb4e6815cdc9ce9af85ac28ea270aab76ade727c7d9ad94922574149971372d57e43d58e61c44d2a0bd2015b4666f33d218')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # readme
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # license
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
