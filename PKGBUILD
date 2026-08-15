# Maintainer: itachi_re <xanbenson99@gmail.com>
#
# This file lives at build/arch/PKGBUILD in the yuki-iptv repo. It is a
# TEMPLATE: pkgver/pkgrel/sha256sums get rewritten by the `aur` job in
# .github/workflows/release.yml on every tagged release before it's pushed
# to the AUR git repo — you don't need to bump those by hand.
#
# Verify `depends=()` below against build/debian/control's Depends: line
# and whatever `pyproject.toml`/`requirements.txt` yuki-iptv actually
# ships — this list is a best-effort starting point based on the modules
# under usr/lib/yuki-iptv/yuki_iptv (gui.py -> PyQt, xtream.py -> requests,
# thirdparty/mpv.py -> mpv), not a verified dependency audit.

pkgname=yuki-iptv
pkgver=260815.4
pkgrel=1
pkgdesc="IPTV player with EPG support, based on mpv and Qt"
arch=('any')
url="https://github.com/itachi-re/yuki-iptv"
license=('GPL-3.0-only')  # verify against COPYING
depends=(
  'python'
  'python-pyqt6'
  'mpv'
  'python-requests'
  'python-unidecode'
  'python-orjson'
  'ttf-font'
  'xdg-utils'
)
optdepends=(
  'yt-dlp: playback of yt-dlp-supported stream URLs'
  'ffmpeg: recording support'
)
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/itachi-re/yuki-iptv/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0eaac7ae9e6d13066d9bc9216f4ff2dbfd374e72acb0b3e8556ad106480036d7')

# The repo checks in a pre-laid-out usr/ tree (same one debian/install
# just points at with a bare "usr" line) — no compilation step, so
# package() just needs to copy it into place.
package() {
  cd "$srcdir/$pkgname-$pkgver"
  cp -a usr "$pkgdir/"
}
