# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname='artifact'
pkgver="2.0.1"
pkgrel=1
pkgdesc='The design doc tool made for developers'
url='http://vitiral.github.io/artifact/'
license=(
 'LGPL3+'
 'CC0'
)
source=(
 "https://github.com/vitiral/artifact/archive/${pkgver}.tar.gz"
)
sha512sums=('a81afe2b38a33a85b4b319aaabbf50b5e76bf8878cf412a0495cf900ccab9c2edc35d70572c21938978184ab3a2c8ff669abaf411dc8e28a1c31f3b36c2b823d')
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
 if [[ $(command -v rustup) ]]; then
   rustup run stable cargo update # 2.0.1 has openssl 0.9 which is too old
   rustup run stable cargo build --release
 else
   rustup run stable cargo update
   cargo build --release
 fi
 popd
}

package() {
 mkdir -p $pkgdir/usr/bin/
 install "${srcdir}/artifact-${pkgver}/target/release/art" "$pkgdir/usr/bin/"
}
