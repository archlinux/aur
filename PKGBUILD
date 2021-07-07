# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=mint
pkgver=0.14.0
pkgrel=3
pkgdesc='A refreshing language for the front-end web'
arch=('x86_64')
url='https://github.com/mint-lang/mint'
license=('BSD')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
        "baked_file_system.patch")
sha256sums=('2ccfa50812b8d9f53ea2e66fb427d42730a8b22ce2831c208f5421fc8c4baf28'
            '99c3ce7d50c7b6f002a84590cb05d1fc4237dda806796ce79c7c5dddbbb87ebc')

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
