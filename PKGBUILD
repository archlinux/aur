# Maintainer: Ishidaw <willianscagol@gmail.com>
pkgname=leshade-git
pkgver=2.3.r9.gc00c2fd
pkgrel=1
pkgdesc="Official build for Leshade. An ReShade Manager for Linux"
arch=('any')
url="https://github.com/Ishidawg/LeShade"
license=('MIT')
depends=('python' 'pyside6')
makedepends=('git' 'meson' 'ninja')
provides=(leshade)
conflicts=(leshade leshade-bin)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  arch-meson . build
  meson compile -C build
}

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" meson install -C build

  sed -i 's/^Exec=.*/Exec=leshade/' "${pkgdir}/usr/share/applications/leshade.desktop"
  sed -i 's/^Icon=.*/Icon=leshade/' "${pkgdir}/usr/share/applications/leshade.desktop"
}
