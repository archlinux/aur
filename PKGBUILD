# Maintainer: tyusha <htovver@gmail.com>
pkgname=rofi-power-menu-git
pkgver=3.0.2.r0.g368ba43
_pkgname=rofi-power-menu
_source=https://github.com/jluttine/rofi-power-menu.git
pkgrel=1
pkgdesc="Configurable power menu mode for Rofi and dmenu"
arch=('any')
url="https://github.com/jluttine/${_pkgname}"
license=('MIT')
# If you want to use dmenu instead, and don't want to install rofi,
# change this to dmenu and also install rofi-script-to-dmenu.
# Full instructions in README/on GitHub.
depends=('rofi')
optdepends=('rofi-script-to-dmenu: Run rofi scripts with dmenu (or with dmenu mode of rofi)'
			'dmenu: Use with dmenu instead of rofi')
provides=('rofi-power-menu')
conflicts=('rofi-power-menu')
source=("${_pkgname}"::"git+${_source}")

sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/$_pkgname" || exit 1
	local doc_path="$pkgdir/usr/share/doc/${pkgname}"

	install -Dm755 "rofi-power-menu" "$pkgdir/usr/bin/rofi-power-menu"
	install -Dm755 "dmenu-power-menu" "$pkgdir/usr/bin/dmenu-power-menu"

	install -Dm755 -d "${doc_path}"

	install -Dm644 "README.md" "${doc_path}/README.md"
	install -Dm644 "screenshot.png" "${doc_path}/screenshot.png"
	install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
