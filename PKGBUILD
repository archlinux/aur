# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname='artifact'
pkgver="0.9.1"
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
sha512sums=(
 'dfdcf31966b254218a5bb1eace186549988faac8a803e98e4d8f3fb7b8f81d149d958870f3880cffe9f70f63042fe0c8c4e428f6842e8b9a5ba5d76b9217820d'
)
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
)

build() {
 pushd "artifact-${pkgver}"
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
