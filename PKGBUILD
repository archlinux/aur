# Maintainer: nrio <nrio@mailbox.org>
pkgname=tcharmap-git
pkgver=r17.bd21536
pkgrel=1
pkgdesc="Overview of unicode characters and their LaTeX counterpart"
arch=('any')
url="https://github.com/nrio0/tcharmap"
license=('MIT')
options=(!emptydirs)
depends=('python' 'python-yaml' 'python-pyqt5')
makedepends=('git' 'xdg-utils')
source=('git+https://github.com/nrio0/tcharmap.git'
        'tcharmap_start')
sha256sums=('SKIP'
            'eb60997b8de05779860d6a7b86758e75c575ed0bef1a54b8ffbc820c12c610a2')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "$srcdir/tcharmap_start" "$pkgdir/usr/bin/tcharmap"
	cd "$srcdir/${pkgname%-git}"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/tcharmap"
  install -Dm644  tcharmap/charmap "$pkgdir/usr/share/tcharmap"
  install -Dm644  tcharmap/tcharmap.py "$pkgdir/usr/share/tcharmap"
  install -Dm644  tcharmap/icons_rc.py "$pkgdir/usr/share/tcharmap"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -d "${pkgdir}"/usr/share/{applications,desktop-directories,icons/hicolor}
  XDG_DATA_DIRS="${pkgdir}/usr/share" xdg-icon-resource install --size 16 --novendor "misc/hicolor/16x16/apps/tcharmap.png"
  XDG_DATA_DIRS="${pkgdir}/usr/share" xdg-icon-resource install --size 22 --novendor "misc/hicolor/22x22/apps/tcharmap.png"
  XDG_DATA_DIRS="${pkgdir}/usr/share" xdg-icon-resource install --size 24 --novendor "misc/hicolor/24x24/apps/tcharmap.png"
  XDG_DATA_DIRS="${pkgdir}/usr/share" xdg-icon-resource install --size 32 --novendor "misc/hicolor/32x32/apps/tcharmap.png"
  XDG_DATA_DIRS="${pkgdir}/usr/share" xdg-icon-resource install --size 48 --novendor "misc/hicolor/48x48/apps/tcharmap.png"
  XDG_DATA_DIRS="${pkgdir}/usr/share" xdg-desktop-menu install --noupdate --novendor misc/tcharmap.desktop
}
