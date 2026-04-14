# Maintainer: Tanishq (Trifalic47) <trifalicapt@gmail.com>
pkgname=rmpv-git
pkgver=r34.6578a3c
pkgrel=2
# pkgdesc="Terminal-based mpv YouTube/music player with yt-dlp streaming and download support"
pkgdesc="A lightweight terminal-based music + video controller using mpv + yt-dlp + mpc + rmpc Built for fast media playback, YouTube streaming, and CLI control. It could also play local as well as youtube songs"
arch=('any')
url="https://github.com/Trifalic47/rmpv"
license=('MIT')
depends=('mpv' 'yt-dlp' 'mpc' 'mpd' 'rofi')
makedepends=('git')
optdepends=('rmpc: for rmpc integration support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=rmpv.install
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# package() {
#   cd "$pkgname"
#
#   # ── Binaries ──────────────────────────────────────────
#   # Standard install for the scripts in bin/
#   install -d "$pkgdir/usr/bin"
#   install -m755 bin/rmpv bin/rmpv-play bin/rmpv-search scripts/rmpv-setup.sh -t "$pkgdir/usr/bin/"
#
#   # Rename the setup script to match your command preference
#   mv "$pkgdir/usr/bin/rmpv-setup.sh" "$pkgdir/usr/bin/rmpv-setup"
#
#   # ── Data files (Templates) ────────────────────────────
#   # This avoids the 'cd' error by using the full path
#   install -d "$pkgdir/usr/share/rmpv"
#   cp -ra dots "$pkgdir/usr/share/rmpv/"
#
#   # ── License & Documentation ───────────────────────────
#   install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
#   if [ -f LICENSE ]; then
#     install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
#   fi
# }

package() {
  cd "$pkgname"

  # Install binaries to /usr/bin (standard for AUR)
  install -Dm755 bin/rmpv "$pkgdir/usr/bin/rmpv"
  install -Dm755 bin/rmpv-play "$pkgdir/usr/bin/rmpv-play"
  install -Dm755 bin/rmpv-search "$pkgdir/usr/bin/rmpv-search"

  # Install the setup script
  install -Dm755 scripts/rmpv-setup.sh "$pkgdir/usr/bin/rmpv-setup"

  # Store the templates in /usr/share/
  install -d "$pkgdir/usr/share/rmpv/dots"
  cp -r dots/* "$pkgdir/usr/share/rmpv/dots/"
}
