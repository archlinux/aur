# Maintainer: ctrl-q <34975747+ctrl-q@users.noreply.github.com>
pkgname=voidrice-git
pkgver=r1
pkgrel=1
pkgdesc="Luke Smith's dotfile scripts from ~/.local/bin"
arch=('any')
url="https://github.com/LukeSmithxyz/voidrice"
license=('GPL2')
depends=('bash')
optdepends=(
  'dmenu: dmenu-based scripts'
  'libnotify: desktop notifications'
  'xdotool: X11 window/input automation'
  'maim: screenshot scripts'
  'ffmpeg: screen recording and audio processing'
  'mpv: video/media scripts'
  'newsboat: RSS feed scripts'
  'transmission-cli: torrent scripts'
  'tor: torwrap anonymization script'
  'pass: password manager scripts'
  'oathtool: OTP script'
  'lf: lfub file manager script'
  'xorg-xrandr: display selection script'
  'xwallpaper: background setter script'
)
makedepends=('git')
source=("$pkgname::git+https://github.com/LukeSmithxyz/voidrice.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  for f in .local/bin/* .local/bin/statusbar/*; do
	  if [ -f "${f}" ] && [ -x "${f}" ]; then
		  install -Dm755 "${f}" "${pkgdir}/usr/bin/$(basename "${f}")"
	  fi
  done
  # Install cron scripts to /usr/lib/voidrice-cron
  for f in .local/bin/cron/*; do
	  if [ -f "${f}" ] && [ -x "${f}" ]; then
		  install -Dm755 "${f}"  "$pkgdir/usr/lib/voidrice-cron/$(basename "$f")"
	  fi
  done
}
