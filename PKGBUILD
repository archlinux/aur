# Maintainer: nrio <nrio@mailbox.org>
pkgname=tcharmap-git
pkgver=r18.333b132
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
            '47bf16b6510c9f1b9bcf052ee0c268cdeb715a6f52290996659b6ce3fdc2a56b')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "$srcdir/tcharmap_start" "$pkgdir/usr/bin/tcharmap"
	cd "$srcdir/${pkgname%-git}"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/tcharmap/tcharmap/resources"
  install -Dm644  tcharmap/charmap "$pkgdir/usr/share/tcharmap/tcharmap"
  install -Dm644  tcharmap/{tcharmap.py,__init__.py,__main__.py} "$pkgdir/usr/share/tcharmap/tcharmap"
  install -Dm644  tcharmap/resources/{icons_rc.py,__init__.py} "$pkgdir/usr/share/tcharmap/tcharmap/resources"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -d "${pkgdir}"/usr/share/{applications,desktop-directories,icons/hicolor}
  XDG_DATA_DIRS="${pkgdir}/usr/share" xdg-icon-resource install --size 16 --novendor "misc/hicolor/16x16/apps/tcharmap.png"
  XDG_DATA_DIRS="${pkgdir}/usr/share" xdg-icon-resource install --size 22 --novendor "misc/hicolor/22x22/apps/tcharmap.png"
  XDG_DATA_DIRS="${pkgdir}/usr/share" xdg-icon-resource install --size 24 --novendor "misc/hicolor/24x24/apps/tcharmap.png"
  XDG_DATA_DIRS="${pkgdir}/usr/share" xdg-icon-resource install --size 32 --novendor "misc/hicolor/32x32/apps/tcharmap.png"
  XDG_DATA_DIRS="${pkgdir}/usr/share" xdg-icon-resource install --size 48 --novendor "misc/hicolor/48x48/apps/tcharmap.png"
  XDG_DATA_DIRS="${pkgdir}/usr/share" xdg-desktop-menu install --noupdate --novendor misc/tcharmap.desktop
}
