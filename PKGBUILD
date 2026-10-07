# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=finance-tracker-tui-git
pkgver=r147.894edf1
pkgrel=3
pkgdesc="Simple TUI expense/investment tracker backed by SQLite (Go)"
arch=('x86_64')
url="https://github.com/shen-kit/finance-tracker-tui"
license=('LicenseRef-unknown')
depends=('sqlite')
makedepends=('go' 'git' 'gcc')
provides=('finance-tracker-tui')
conflicts=('finance-tracker-tui')
source=("finance-tracker-tui::git+https://github.com/shen-kit/finance-tracker-tui.git")
sha256sums=('SKIP')

pkgver() {
	cd finance-tracker-tui
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd finance-tracker-tui/src
	export CGO_ENABLED=1
	go build -trimpath -o finance-tracker .
}

package() {
	cd finance-tracker-tui
	install -Dm755 src/finance-tracker "$pkgdir/usr/bin/finance-tracker"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 db-schema.txt "$pkgdir/usr/share/$pkgname/db-schema.txt"
	install -d "$pkgdir/usr/share/doc/$pkgname/screenshots"
	install -Dm644 screenshots/*.png "$pkgdir/usr/share/doc/$pkgname/screenshots/"
}
