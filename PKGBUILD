# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=mint
pkgver=0.14.0
pkgrel=2
pkgdesc='A refreshing language for the front-end web'
arch=('x86_64')
url='https://github.com/mint-lang/mint'
license=('BSD')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
        "baked_file_system.patch")
sha256sums=('2ccfa50812b8d9f53ea2e66fb427d42730a8b22ce2831c208f5421fc8c4baf28'
            'b1ac390bed113437ba3eb1345bfa8730eb5474dc99133052a74ea137f1f246a5')

build() {
  cd "${pkgname}-${pkgver}"

  # Get dependencies
  PATH="/usr/bin" shards

  # Fix issue on baked_file_system crystal dependencies with building in hidden directory
  patch -p1 -i "${srcdir}/baked_file_system.patch"

  # Build binary
  PATH="/usr/bin" shards build --progress --release --no-debug
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "bin/mint" "${pkgdir}/usr/bin/mint"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/mint/LICENSE"
}
