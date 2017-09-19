# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname='artifact'
pkgver="1.0.0"
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
sha512sums=('fe102d63ee2a99b2c438101eb49f8f8ca9c2bd78d7af525be13f1fcb8cc2e65458b76595a175830fbef9a709de78a6e8028543cbf18955412e0673d86f4dc2af')
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
