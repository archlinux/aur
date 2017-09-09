# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname='artifact'
pkgver="0.9.6"
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
sha512sums=('ea7f26ad5e9967eacd7e449ad5320cd8a484e565b5b6f4a8293210a1c869814ea4d82aa08f7c5eb182496390a629f06cc740cbb7271f28ddba4ac1500cfe53a8')
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
