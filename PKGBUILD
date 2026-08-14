# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: mags <c.magyar.ec@gmail.com>
# Contributor: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=cropgui
pkgver=0.9
pkgrel=3
pkgdesc='A GTK GUI for lossless JPEG cropping'
arch=('any')
url='https://codeberg.org/jepler/cropgui'
license=('GPL-2.0-or-later')
depends=(
  gtk3
  python
  python-pillow
  python-gobject
  libjpeg-turbo
  perl-image-exiftool
  imagemagick
)
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/jepler/cropgui/archive/v${pkgver}.tar.gz")
sha256sums=('08f4414157157d438e8225678255724afebd498b07edb4281096d535e8ee2b0c')

package() {
  local _python=3.14
  [[ $(python -V) =~ ^Python\ ([0-9]+\.[0-9]+).* ]] && _python="${BASH_REMATCH[1]}"
  cd "$pkgname"
  install -Dm644 cropgui.desktop "$pkgdir/usr/share/applications/cropgui.desktop"
  install -Dm644 cropgui.png "$pkgdir/usr/share/pixmaps/cropgui.png"
  install -Dm755 cropgtk.py "$pkgdir/usr/lib/python$_python/site-packages/cropgui/cropgtk.py"
  install -Dm644 -t "$pkgdir/usr/lib/python$_python/site-packages/cropgui/" cropgui_common.py filechooser.py cropgui.glade
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/lib/python$_python/site-packages/cropgui/cropgtk.py" "$pkgdir/usr/bin/cropgui"
}
