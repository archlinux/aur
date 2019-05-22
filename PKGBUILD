# Maintainer: Matthias De Bie <mattydebie@gmail.com>
pkgname=bitwarden-rofi-git
pkgver=0.4.r9.5f70386
pkgrel=1
pkgdesc="Wrapper for Bitwarden bitwarden/cli and Rofi"
arch=('any')
url="https://github.com/mattydebie/bitwarden-rofi"
license=('GPL3')
depends=('rofi' 'jq' 'bitwarden-cli')
makedepends=('git')
optdepends=('xsel: copy to clipboard' 'xclip: copy to clipboard' 'wl-clipboard' 'xdotool')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=("${pkgname%-git}")
source=("git+https://github.com/mattydebie/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}" || exit 1
  local doc_path="$pkgdir/usr/share/doc/${pkgname}"

  install -Dm755 "bwmenu" "$pkgdir/usr/bin/bwmenu"
  install -Dm755 "lib-bwmenu" "$pkgdir/usr/bin/lib-bwmenu"

  install -Dm755 -d "$pkgdir/usr/share/doc/${pkgname}"
  install -Dm755 -d "$pkgdir/usr/share/doc/${pkgname}/img"

  install -Dm644 "README.md" "${doc_path}/README.md"
  install -Dm644 img/* "${doc_path}/img/"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
