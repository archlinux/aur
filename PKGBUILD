pkgname=hyprshot-gui-git
pkgver=r16.30a9bc3
pkgrel=2
pkgdesc="Zenity GUI for Hyprshot"
arch=('any')
url="https://github.com/ThatOneCalculator/hyprshot-gui"
license=('GPL')
groups=()
depends=('hyprshot' 'zenity' 'jq')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/ThatOneCalculator/hyprshot-gui')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m755 ./hyprshot-gui ${pkgdir}/usr/bin/hyprshot-gui
	install -D -m644 ./hyprshot-gui.desktop ${pkgdir}/usr/share/applications/hyprshot-gui.desktop
}
