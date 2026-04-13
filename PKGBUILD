# Maintainer: Tanishq (Trifalic47) <trifalicapt@gmail.com>
pkgname=rmpv-git
pkgver=r33.17e0018
pkgrel=1
pkgdesc="RMPV - terminal-based mpv YouTube/music player with rmpc integration, yt-dlp streaming, and download support"
arch=('any')
url="https://github.com/Trifalic47/rmpv"
license=('MIT')
depends=('mpv' 'yt-dlp' 'mpc' 'mpd' 'rmpc' 'rofi')
makedepends=('git')
provides=('rmpv')
conflicts=('rmpv')
install=rmpv.install
source=("$pkgname::git+https://github.com/Trifalic47/rmpv.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  # ── binaries ──────────────────────────────────────────
  install -Dm755 bin/rmpv        "$pkgdir/usr/bin/rmpv"
  install -Dm755 bin/rmpv-play   "$pkgdir/usr/bin/rmpv-play"
  install -Dm755 bin/rmpv-search "$pkgdir/usr/bin/rmpv-search"

  # ── setup script (user runs once after install) ───────
  install -Dm755 scripts/rmpv-setup.sh "$pkgdir/usr/bin/rmpv-setup"

  # ── dotfile templates → /usr/share/rmpv/dots ─────────
  # copying entire dots/ tree so rmpv-setup can cp -r it to ~/.config
  install -d "$pkgdir/usr/share/rmpv"
  cp -r dots "$pkgdir/usr/share/rmpv/dots"

  # ── readme ────────────────────────────────────────────
  install -Dm644 README.md "$pkgdir/usr/share/doc/rmpv/README.md"
}
