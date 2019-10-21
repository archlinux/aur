# Maintainer: Mathias Roux <poussinberlin@gmail.com>
pkgname=cawbird-12
_pkgname=cawbird
pkgver=1.0.2
pkgrel=1
pkgdesc="A fork of the Corebird GTK Twitter client that continues to work with Twitter "
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://ibboard.co.uk/cawbird/"
license=('GPL')
depends=(
  'gtk3'
  'libgee'
  'sqlite3'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-libav'
  'gspell')
optdepends=('noto-fonts-emoji: Emoji support')
makedepends=('vala' 'meson' 'intltool')
conflicts=('corebird' 'corebird-git' 'corebird-non-streaming-git' 'cawbird-git' 'cawbird')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/IBBoard/cawbird/archive/v${pkgver}.tar.gz")
sha1sums=('be497abef647f6f5592afa84cc69af13b1c38033')

build() {
  cd "$srcdir/cawbird-$pkgver"
  meson builddir --prefix=/usr -D VIDEO=yes -D SPELLCHECK=yes
  ninja -C builddir
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="${pkgdir}" ninja -C builddir install
}
