# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname=qman-git
pkgver=1.0.3
pkgrel=2
pkgdesc="A more modern manual page viewer for our terminals"

arch=('x86_64')
url="https://github.com/plp13/qman"
license=("BSD-2-CLAUSE")
depends=("ncurses" "libinih" "zlib")
makedepends=("git" "meson" "pandoc-cli" "python-cogapp")
source=("$pkgname"::"git+https://github.com/plp13/qman.git")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  sed -i "s/install_dir\: 'man\/man1'/install_dir: 'share\/man\/man1'/g" "src/meson.build"
  meson setup "build/" "src/"
  cd "build/"
  meson configure -Dprefix="/usr"
  meson compile
}

package() {
  cd "${pkgname}"
  cd "build/"
  meson install --destdir "${pkgdir}"
  cd "../"
  install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/qman/README.md"
  install -Dm 644 "TESTING.md" "${pkgdir}/usr/share/doc/qman/TESTING.md"
}
