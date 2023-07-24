# Maintainer: RhiobeT (Pierre Jeanjean) <rhiobet@gmail.com>
pkgname=mpv-uosc-git
_gitname=uosc
pkgver=4.7.0.r42.g72982e2
pkgrel=1
pkgdesc='Feature-rich minimalist proximity-based UI for MPV player'
arch=(x86_64)
url=https://github.com/tomasklaen/uosc
license=(
  GPL3
)
makedepends=(
  git
)
depends=(
  'mpv>=0.33'
)
optdepends=('mpv-thumbfast: for showing thumbnails on-the-fly on seek')
provides=(mpv-uosc)
conflicts=(mpv-uosc)
source=(
  uosc::git+https://github.com/tomasklaen/uosc.git
)
sha256sums=(
  SKIP
)

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  find scripts -type f -exec sh -c 'install -Dm 644 {} -t "'${pkgdir}'/etc/mpv/$(dirname {})"' \;
  install -Dm 644 "script-opts/uosc.conf" -t "${pkgdir}/etc/mpv/script-opts/"
  install -Dm 644 "fonts/uosc_icons.otf" "fonts/uosc_textures.ttf" -t "${pkgdir}/etc/mpv/fonts/"
}

# vim: ts=2 sw=2 et:

