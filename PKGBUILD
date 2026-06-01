# Maintainer: AbsolKing <alexiulian.tanase@gmail.com>
pkgname=forgesmith
pkgver=0.6.0
pkgrel=1
pkgdesc='Folder-aware FLAC tagger using MusicBrainz, with built-in synced-lyrics embedding (GNOME)'
arch=('any')
url='https://github.com/AbsolKing/forgesmith'
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'python'
  'python-gobject'
  'python-mutagen'
  'python-aiohttp'
)
optdepends=(
  'chromaprint: audio fingerprinting fallback via AcoustID (needs a free API key)'
)
makedepends=(
  'meson'
  'ninja'
  'blueprint-compiler'
  'appstream'
  'desktop-file-utils'
  'gettext'
  'glib2'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/AbsolKing/forgesmith/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b3c56aaeb7e07d56d03e8e2f5ac7c9f9059d33151406131e3dea3d69a6cdcb35')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
