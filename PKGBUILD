# Maintainer: RhiobeT (Pierre Jeanjean) <rhiobet@gmail.com>
pkgname=mpv-uosc-git
_gitname=uosc
pkgver=4.5.0.r4.ge33db65
pkgrel=1
pkgdesc='Feature-rich minimalist proximity-based UI for MPV player'
arch=(x86_64)
url=https://github.com/tomasklaen/uosc
license=(
  GPL3
)
depends=(
  mpv
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
  cd "$srcdir/$_gitname/scripts/uosc_shared"
  find . -type f -exec sh -c 'install -Dm 644 {} -t "'${pkgdir}'/etc/mpv/scripts/uosc/uosc_shared/$(dirname {})"' \;
  cd "$srcdir/$_gitname"
  install -Dm 644 "scripts/uosc.lua" "${pkgdir}/etc/mpv/scripts/uosc/main.lua"
  install -Dm 644 "script-opts/uosc.conf" -t "${pkgdir}/etc/mpv/script-opts/"
  install -Dm 644 "fonts/uosc_icons.otf" "fonts/uosc_textures.ttf" -t "${pkgdir}/etc/mpv/fonts/"
}

# vim: ts=2 sw=2 et:

