# Maintainer: tyusha <htovver@gmail.com>
pkgname=rofi-power-menu-git
pkgver=r37.368ba43
_name=rofi-power-menu
pkgrel=1
pkgdesc="Configurable power menu mode for Rofi and dmenu"
arch=('any')
url="https://github.com/jluttine/${_name}"
license=('MIT')
# If you want to use dmenu instead, and don't want to install rofi,
# change this to dmenu and also install rofi-script-to-dmenu.
# Full instructions in README/on GitHub.
depends=('rofi')
optdepends=('rofi-script-to-dmenu: Run rofi scripts with dmenu (or with dmenu mode of rofi)'
			'dmenu: Use with dmenu instead of rofi')
provides=('dmenu-power-menu')
source=("git+https://github.com/jluttine/${_name}")

sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_name"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd "${srcdir}/$_name" || exit 1
	local doc_path="$pkgdir/usr/share/doc/${pkgname}"

	install -Dm755 "rofi-power-menu" "$pkgdir/usr/bin/rofi-power-menu"
	install -Dm755 "dmenu-power-menu" "$pkgdir/usr/bin/dmenu-power-menu"

	install -Dm755 -d "${doc_path}"

	install -Dm644 "README.md" "${doc_path}/README.md"
	install -Dm644 "screenshot.png" "${doc_path}/screenshot.png"
	install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
