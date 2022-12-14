# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=protonplus
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple proton version manager"
arch=('x86_64')
url="https://github.com/Vysp3r/ProtonPlus"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'libarchive' 'libsoup3')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('002045424a2e071eac4ab8edb7e614ae99ea21f56897db8762a91b3e518b331d')

build() {
  arch-meson "ProtonPlus-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build

  cd "ProtonPlus-$pkgver"
  appstream-util validate-relax --nonet data/*.appdata.xml
  desktop-file-validate data/*.desktop
}

package() {
  meson install -C build --destdir "$pkgdir"
}
