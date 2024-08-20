# Maintaner: Rudra Saraswat <rs2009@ubuntu.com>

pkgname=apx-gui
pkgver=1.0.3
pkgrel=1
pkgdesc='A frontend in GTK 4 and Libadwaita for Apx.'
arch=('any')
url="https://github.com/Vanilla-OS/apx-gui"
license=('GPL-3.0-only')
depends=(
  'apx'
  'gtk4'
  'libadwaita'
  'python'
  'python-gobject'
  'python-requests'
  'vte4'
)
makedepends=('meson' 'ninja' 'libadwaita')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Vanilla-OS/apx-gui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  [[ -d apx-gui ]] && rm -rf apx-gui || :
  mv apx-gui-*/ apx-gui && cd apx-gui
  meson setup --prefix='/usr' build
  ninja -C build
}

package() {
  cd apx-gui
  DESTDIR="$pkgdir" ninja -C build install
}
