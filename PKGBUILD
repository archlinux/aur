# Maintainer: RhiobeT (Pierre Jeanjean) <rhiobet@gmail.com>
pkgname=mpv-uosc-git
_gitname=uosc
pkgver=5.0.0.r21.gbf7f970
pkgrel=1
pkgdesc='Feature-rich minimalist proximity-based UI for MPV player'
arch=(x86_64)
url=https://github.com/tomasklaen/uosc
license=(
  GPL3
)
makedepends=(
  curl
  git
  unzip
)
depends=(
  mpv
)
optdepends=('mpv-thumbfast: for showing thumbnails on-the-fly on seek')
provides=(mpv-uosc)
conflicts=(
  mpv-uosc
  'mpv<0.33'
)
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
  chmod u+x ./installers/unix.sh
  MPV_CONFIG_DIR="${pkgdir}/etc/mpv/" ./installers/unix.sh
  find -name 'LICENSE*' -exec install -Dm644 {} "$pkgdir/usr/share/licenses/$pkgname/{}" \;
}

# vim: ts=2 sw=2 et:

