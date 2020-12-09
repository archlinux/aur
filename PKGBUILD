# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Alexandre Moine < nobrakal at moine dot org >
# Contributor: Tasos Latsas < tlatsas2000 at gmail dot com >

pkgname=t4kcommon
pkgver=0.1.1
pkgrel=5
pkgdesc="A library of code shared between tuxmath and tuxtype."
arch=("i686" "x86_64")
url="https://github.com/tux4kids/${pkgname}"
license=("GPL")
depends=("librsvg" "sdl_image" "sdl_mixer" "sdl_net" "sdl_pango")
options=(!docs)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/tux4kids/${pkgname}/archive/upstream/${pkgver}.tar.gz"
  "libpng15.patch"
  "https://sources.debian.org/data/main/t/t4kcommon/0.1.1-6/debian/patches/916060_bugfix.patch"
  "wrapped_lines.patch"
)
sha256sums=(
  "be4cadbcf2728ed6efb1c71e96c209184a7829b65af3625d9410a29fb2fd775a"
  "e2998909bed025becbe52969eb53b40eede05e75285b400cbafac6207cf82c3f"
  "1d5bb9a9cf809f26508e4611fb564e050b554036a679ec28b79827785a3f46c8"
  "0643e9eada6fdba1a295798ea3d09be71cafbf5af6ba132dd15a4f372d58dcf3"
)

prepare() {
  cd "${srcdir}/${pkgname}-upstream-${pkgver}"

  patch -Np1 -i "${srcdir}/libpng15.patch"
  patch -Np1 -i "${srcdir}/916060_bugfix.patch"
  patch -Np1 -i "${srcdir}/wrapped_lines.patch"
}

build() {
  cd "${srcdir}/${pkgname}-upstream-${pkgver}"

  ./configure \
    --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-upstream-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
