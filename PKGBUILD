# Maintainer: Vitaliy Berdinskikh <ur6lad at gmail dot com>
# Modified by Chris Chamberlain <chris at chamberlain dot id dot au>
pkgname=swayshot-no-bash-git
_pkgname=swayshot
pkgver=r21.b6f87b8
pkgrel=1
pkgdesc='Sway screenshots: screen, window or region - removed bashisms'
arch=('any')
url='https://gitlab.com/neon64/swayshot'
license=('Apache')
depends=('sway' 'xdg-user-dirs' 'grim' 'slurp' 'jq')
optdepends=('wl-clipboard: copy the full path to clipboard'
	'xsel: copy the full path to clipboard'
	'xclip: copy the full path to clipboard')
provides=('swayshot')
conflicts=('swaygrab-helper' 'swayshot')
source=(git+https://gitlab.com/neon64/swayshot.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir"/$_pkgname

	install -d "$pkgdir"/etc/sway/config.d
	install -m 644 $_pkgname.config "$pkgdir"/etc/sway/config.d/$_pkgname
	install -d "$pkgdir"/usr/bin
	install -m 755 $_pkgname.sh "$pkgdir"/usr/bin/$_pkgname
}

