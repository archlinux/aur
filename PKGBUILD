# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jan Böhringer <janboe@gmail.com>
# Contributor: Frédérik Paradis <fredy_14@live.fr>
# Contributor: GI_Jack <GI_Jack@hushmail.com>

pkgname=gtkhash
pkgver=1.5
pkgrel=1
pkgdesc="A GTK+ utility for computing message digests or checksums"
arch=('x86_64')
url="https://github.com/tristanheaven/gtkhash"
license=('GPL')
depends=(
    'dconf'
    'gtk3'
    'libb2'
    'libgcrypt'
    'mbedtls'
    'nettle'
)

makedepends=(
    'appstream-glib'
    'dconf'
    'gtk3'
    'intltool' 
    'librsvg'
    'meson'
    'nettle'
    'xdg-utils'
)
provides=(${pkgname})
conflicts=(
  gtkhash-caja 
  gtkhash-nautilus 
  gtkhash-nemo
  gtkhash-thunar
)
source=("${url}/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('7102a192eca3e82ed67a8252a6850440e50c1dbea7c6364bda154ec80f8ff005')

prepare() {
  mkdir -p plugins
}


build() {
  arch-meson "$pkgbase-$pkgver" build \
    -Dglib-checksums='true' \
    -Dlinux-crypto='true' \
    -Dmbedtls='true' \
    -Dnettle='true' \
    -Dbuild-caja='false' \
    -Dbuild-nautilus='false' \
    -Dbuild-nemo='false' \
    -Dbuild-thunar='false'
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

}
