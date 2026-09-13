# Maintainer: tassiovirginio <tassiovirginio@gmail.com>

pkgname=strata-fm-git
pkgver=0.16.0.r28.g9b4b77a
pkgrel=1
pkgdesc='A fast, keyboard-first file manager for Linux (git build)'
arch=('x86_64' 'aarch64')
url='https://stratafiles.io/'
license=('MIT')
provides=('strata')
conflicts=('strata' 'strata-bin')
depends=(
  'bubblewrap'
  'ffmpeg'
  'ffmpegthumbnailer'
  'fontconfig'
  'gst-libav'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gtk4'
  'gtksourceview5'
  'gvfs'
  'poppler-glib'
)
makedepends=(
  'cargo'
  'rust'
  'pkg-config'
  'git'
  'glib2'
  'gdk-pixbuf2'
  'cairo'
  'pango'
  'graphene'
  'gstreamer'
  'gst-plugins-base'
  'gtk4'
  'gtksourceview5'
  'poppler-glib'
  'fontconfig'
)
optdepends=(
  'gvfs-smb: SMB network share support'
  'imagemagick: additional image preview support'
  'libraw: camera RAW preview support'
  'dcraw: camera RAW preview support'
)
source=("strata::git+https://github.com/lgse/strata.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/strata"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/strata"
  cargo build --release
}

package() {
  cd "$srcdir/strata"

  install -Dm755 target/release/strata "$pkgdir/usr/bin/strata"
  install -Dm644 data/io.github.lgse.Strata.desktop "$pkgdir/usr/share/applications/io.github.lgse.Strata.desktop"
  install -Dm644 data/icons/scalable/apps/io.github.lgse.Strata.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.lgse.Strata.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY_LICENSES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.md"
  install -Dm644 data/licenses/UnRAR.txt "$pkgdir/usr/share/licenses/$pkgname/UnRAR.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 data/io.github.lgse.Strata.FileManager1.service "$pkgdir/usr/share/doc/$pkgname/io.github.lgse.Strata.FileManager1.service"
}