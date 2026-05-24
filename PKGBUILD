# Maintainer: Rick <RickStylesProyects>
pkgname=maple-saturation-control-git
_pkgname=Maple-SaturationControl-WaylandPlasma
pkgver=1.0.0
pkgrel=1
pkgdesc="A screen color saturation and contrast gamma control tool for KDE Plasma Wayland sessions."
arch=('any')
url="https://github.com/MapleProjects/Maple-SaturationControl-WaylandPlasma"
license=('GPL3')
depends=('python' 'python-pyqt6' 'argyllcms' 'colord' 'iccxml')
makedepends=('git')
provides=('maple-saturation-control')
conflicts=('maple-saturation-control')
source=("git+https://github.com/MapleProjects/Maple-SaturationControl-WaylandPlasma.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  
  # Install the main Python script
  install -Dm755 maple_saturation_control.py "$pkgdir/usr/bin/maple-saturation-control"
  
  # Install the .desktop entry
  install -Dm644 MapleSaturation.desktop "$pkgdir/usr/share/applications/maple-saturation-control.desktop"
  
  # Update the executable path inside the installed .desktop entry to use system binary /usr/bin/maple-saturation-control
  sed -i 's|Exec=.*|Exec=/usr/bin/maple-saturation-control|' "$pkgdir/usr/share/applications/maple-saturation-control.desktop"
}
