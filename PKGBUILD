pkgname=grabclip-git
pkgver=r5.4fe68b2
pkgrel=1
pkgdesc="Native GTK media downloader for Linux"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/garethmcc/grabclip"
license=('MIT')
depends=('gtk4' 'libadwaita' 'yt-dlp' 'ffmpeg' 'deno')
makedepends=('cargo' 'git')
provides=('grabclip')
conflicts=('grabclip')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/grabclip"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/grabclip"
  cargo build --release --locked
}

package() {
  cd "$srcdir/grabclip"

  install -Dm755 "target/release/grabclip" "$pkgdir/usr/bin/grabclip"
  install -Dm644 "packaging/linux/grabclip.desktop" \
    "$pkgdir/usr/share/applications/grabclip.desktop"
  install -Dm644 "assets/icons/grabclip.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/grabclip.svg"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
