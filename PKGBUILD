# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jan Böhringer <janboe@gmail.com>
# Contributor: Frédérik Paradis <fredy_14@live.fr>
# Contributor: GI_Jack <GI_Jack@hushmail.com>

pkgname=gtkhash-thunar
pkgver=1.4
pkgrel=4
pkgdesc="A GTK+ utility for computing message digests or checksums (Gtkhash with Thunar filemanager plugin)"
arch=('x86_64')
url="https://github.com/tristanheaven/gtkhash"
license=('GPL')
depends=(
    'dconf'
    'gtk3'
    'libb2'
    'nettle'
    'thunar'
)

makedepends=(
    'dconf'
    'gtk3'
    'intltool'
    'librsvg'
    'nettle'
    'thunar'
    'xdg-utils'
)
provides=(
  gtkhash
  ${pkgname}
)
conflicts=(
  gtkhash 
  gtkhash-caja
  gtkhash-nautilus
  gtkhash-nemo
)
source=("${url}/releases/download/v$pkgver/gtkhash-$pkgver.tar.xz")
sha256sums=('20b57dbb8f6c6d7323f573c111a11640603a422c5f9da7b302a4981e4adc37c4')

build() {
  cd gtkhash-$pkgver

  ./configure --prefix=/usr \
              --disable-schemas-compile \
              --enable-gtkhash \
              --enable-linux-crypto \
              --enable-nettle \
              --disable-blake2 \
              --with-gtk=3.0 \
              --enable-thunar

  make
}

package() {

  make -C gtkhash-$pkgver/src/nautilus DESTDIR="$pkgdir/" install
}
