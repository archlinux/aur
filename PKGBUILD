# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname="qman"
pkgver="1.3.1"
pkgrel="4"
epoch="1"
pkgdesc="A more modern manual page viewer for our terminals"
arch=("x86_64")
url="https://github.com/plp13/qman"
license=("BSD-2-Clause")
depends=("ncurses" "libinih" "zlib" "man-db")
optdepends=("bzip2: support for bzip2-compressed man pages")
makedepends=("git" "meson" "python-cogapp")
provides=("qman")
conflicts=("qman-git")
replaces=("qman-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plp13/qman/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("e7be878f3ba065fb4abf170791a5e313fccba6f1329c0322a346f3e66d524f99")

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i "s/install_dir\: 'man\/man1'/install_dir: 'share\/man\/man1'/g" "man/meson.build"
}

build() {
  arch-meson build "${pkgname}-${pkgver}"
  meson compile -C build
}

package() {
  meson install --destdir "${pkgdir}" -C build
  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
