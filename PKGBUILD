# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname='artifact'
pkgver="2.1.5"
pkgrel=2
pkgdesc='The design doc tool made for developers'
url='http://vitiral.github.io/artifact/'
license=(
 'LGPL3+'
 'CC0'
)
source=(
 "https://github.com/vitiral/artifact/archive/v${pkgver}.tar.gz"
)
sha512sums=('a111d930f9075bd7ae524d66e3e454858492994da609e7967749ccb5c7360f5dff5d5fdaf4738b559c6ab77e1a070ec16330ab21d90672cc652e4676559b51b9')
arch=(
 'x86_64'
 'i686'
)
depends=(
 'glibc'
 'gcc-libs'
)
makedepends=(
 'rust'
 'cargo'
 'cargo-web'
 'mdbook'
)

build() {
 pushd "artifact-${pkgver}"
 cargo-web deploy -p artifact-frontend --release --target=wasm32-unknown-unknown
 if [[ $(command -v rustup) ]]; then
   rustup run stable cargo build --release
 else
   cargo build --release
 fi
 popd
}

package() {
 mkdir -p $pkgdir/usr/bin/
 install "${srcdir}/artifact-${pkgver}/target/release/art" "$pkgdir/usr/bin/"
}
