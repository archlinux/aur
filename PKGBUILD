# Maintainer: SleepNoMore <nninkovic95@gmail.com>
# Contributor: Angel Talero <angelgotalero@outlook.com>
pkgname=qsgreeter-hyprland-git
pkgver=r20.7898fb0
pkgrel=1
pkgdesc='QuickShell-based greeter for greetd, running under Hyprland'
arch=('any')
url='https://github.com/nninkovic95/greetd-qsgreeter'
license=('MIT')
depends=('greetd' 'quickshell' 'hyprland' 'glib2' 'accountsservice')
makedepends=('git')
provides=('qsgreeter')
conflicts=('qsgreeter' 'qsgreeter-git')
backup=('etc/greetd/qsgreeter-hyprland.lua'
        'etc/xdg/quickshell/qsgreeter/colorscheme.json'
        'etc/xdg/quickshell/qsgreeter/style.json')
install="$pkgname.install"
source=("${pkgname}::git+${url}.git#branch=hyprland")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "$pkgname"

	# Greeter QML tree
	find qsgreeter -type f -exec install -Dm644 "{}" "$pkgdir/etc/xdg/quickshell/{}" \;

	# Hyprland config used by greetd. Installed explicitly: the Makefile only
	# installs it when the Hyprland binary is found at build time.
	install -Dm644 hyprland/qsgreeter-hyprland.lua "$pkgdir/etc/greetd/qsgreeter-hyprland.lua"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
