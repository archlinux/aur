mkdir -p "$HOME/.cache/pacman/pkg"
PKGDEST="$HOME/.cache/pacman/pkg/$pkgname"

pkgname=vnrez
pkgver=3.1
pkgrel=1
pkgdesc="All-in-one Linux tool for recording, screenshots to share your files online."
arch=('any')
url="https://github.com/verysillycat/vnrez"
license=('AGPL-3.0')
source=("https://github.com/verysillycat/vnrez/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
install=vnrez.install

depends=('jq' 'ffmpeg')
optdepends=(
    'grim: Alternative Screenshot manager (required for wlr-roots)'
    'flameshot: Screenshot manager'
    'kooha: [WAYLAND] GNOME, COSMIC, KDE & Cinnamon support'
    'wl-clipboard: Wayland Clipboard support'
    'slurp: Wayland wlroots based support'
    'wf-recorder: Wayland wlroots based support'
    'wl-screenrec: Alternative for Wayland wlroots based support'
    'xclip: X11 Clipboard support'
    'slop: X11 Support'
)

prepare() {
  cd "$srcdir"
  mkdir -p "${pkgdir}/opt/vnrez"
  tar xzf v${pkgver}.tar.gz
}

package() {
  mkdir -p "${pkgdir}/opt/vnrez"
  cp -r vnrez-${pkgver}/* "${pkgdir}/opt/vnrez"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/vnrez/vnrez.sh" "${pkgdir}/usr/bin/vnrez"

  mkdir -p "${pkgdir}/usr/share/doc/vnrez"
  if [[ -f "${pkgdir}/opt/vnrez/README.md" ]]; then
    install -Dm644 "${pkgdir}/opt/vnrez/README.md" "${pkgdir}/usr/share/doc/vnrez/README.md"
  fi
}
