# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname='artifact'
pkgver="1.0.1"
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
sha512sums=('4af07f3a360f534b4c19bfded10cc488584d56877f87341e6a59404cf6f6a5b491a8aaa680dbce51f4039b58222e2439ead04ddfb8a8788b91a6ddaa6bced811')
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
