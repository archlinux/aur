# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=finance-tracker-tui-git
pkgver=r147.894edf1
pkgrel=2
pkgdesc="Simple TUI expense/investment tracker backed by SQLite (Go)"
arch=('x86_64')
url="https://github.com/shen-kit/finance-tracker-tui"
license=('unknown')
depends=()
makedepends=('go' 'git' 'gcc')
provides=('finance-tracker-tui')
conflicts=('finance-tracker-tui')
source=("finance-tracker-tui::git+https://github.com/shen-kit/finance-tracker-tui.git")
sha256sums=('SKIP')
function pkgver() {
	cd finance-tracker-tui
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
function build() {
	cd finance-tracker-tui/src
	export CGO_ENABLED=1
	go build -trimpath -o finance-tracker .
}
function package() {
	cd finance-tracker-tui/src
	install -Dm755 finance-tracker "$pkgdir/usr/bin/finance-tracker"
}
