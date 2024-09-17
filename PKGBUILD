# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Maintainer: Radu C. Martin <radu dot c dot martin at gmail dot com>

_pkgver=4.1.1_1
pkgname=textpieces
pkgver=4.1.1
pkgrel=1
pkgdesc="Small tool for quick text transformations"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/liferooter/textpieces"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtksourceview5')
makedepends=('blueprint-compiler' 'git' 'meson' 'rust' 'vala')
checkdepends=('appstream-glib')
conflicts=("${pkgname}-git")
options=('!debug' '!emptydirs')
source=("${url}/-/archive/v${_pkgver/_/-}/${pkgname}-v${_pkgver/_/-}.tar.gz")
b2sums=('003472a5c1f1a8cbb9dd332202b266b2cec1dbf05cc6d0e5b0b605234e799c7e275416ba2209dfd342792a7dbcea752822f760924d9ba3073ee345722e83ad4e')

build() {
  mkdir -p "${srcdir}"/output
  arch-meson "${pkgname}-v${_pkgver/_/-}" build
  meson compile -C build
  # Install step must be on build because it builds something
  meson install -C build --destdir "${srcdir}"/output
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  mv "${srcdir}"/output/* "${pkgdir}"
  rmdir "${srcdir}"/output
}
