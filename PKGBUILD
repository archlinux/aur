# Maintainer: Zan Skamljic <zan.skamljic@gmail.com>

pkgname=tde-ariadne
pkgver=0.3.4
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
  'libtde>=0.4.0'
  qt6-base
  qt6-svg
  wayland
)
makedepends=(
  cmake
  ninja
)
optdepends=(
  'udisks2: mounting and ejecting drives, unlocking encrypted ones'
  'exfatprogs: formatting drives as exFAT'
  'dosfstools: formatting drives as FAT'
  'ntfs-3g: formatting drives as NTFS'
  'btrfs-progs: formatting drives as Btrfs'
  'gvfs-mtp: phones and cameras'
  'gvfs-smb: Windows shares (gvfs itself covers SFTP, FTP and WebDAV)'
  'papers: PDF and comic book thumbnails'
  'ffmpegthumbnailer: video thumbnails'
  'bubblewrap: running thumbnailers in a sandbox'
  'librsvg: drawing icons that Qt draws with black patches'
  'qt6-imageformats: thumbnails for WebP, TIFF and other image formats'
  'adwaita-icon-theme: fallback for icons missing from the icon theme'
  'xdg-desktop-portal: picking files for other applications'
)
install=ariadne.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('24468cf844c5056002094e69f894db30eda6a2aeb83ea7b9273a49800dbfc379')

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
