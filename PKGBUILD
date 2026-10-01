# Maintainer: Zan Skamljic <zan.skamljic@gmail.com>

pkgname=tde-ariadne
pkgver=0.1.0
pkgrel=1
pkgdesc='A Nautilus-style file manager built with Qt 6'
arch=(x86_64 aarch64)
url='https://github.com/zskamljic/tde-ariadne'
license=(GPL-3.0-or-later)
depends=(
  glibc
  libarchive
  libgcc
  libstdc++
  lua
  qt6-base
  qt6-svg
)
makedepends=(
  cmake
  ninja
)
optdepends=(
  'udisks2: mounting and ejecting drives, unlocking encrypted ones'
  'gvfs-mtp: phones and cameras'
  'gvfs-smb: Windows shares (gvfs itself covers SFTP, FTP and WebDAV)'
  'papers: PDF and comic book thumbnails'
  'ffmpegthumbnailer: video thumbnails'
  'qt6-imageformats: thumbnails for WebP, TIFF and other image formats'
  'adwaita-icon-theme: fallback for icons missing from the icon theme'
)
install=ariadne.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c802bc2af5906b7f7cdec7ded38a512d5217f5132940809e8844f33762fd1044')

build() {
  cmake -B build -S "$pkgname-$pkgver" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
