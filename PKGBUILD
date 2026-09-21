# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=rss-cli-git
pkgver=r25.111d396
pkgrel=1
pkgdesc="A UNIX-inspired CLI application for interacting with RSS feeds"
arch=('x86_64')
url="https://github.com/Clortox/rss-cli"
license=('AGPL-3.0-or-later')
depends=('curl')
makedepends=('git' 'gcc' 'make' 'pkgconf')
provides=('rss-cli')
conflicts=('rss-cli')
source=("rss-cli::git+https://github.com/Clortox/rss-cli.git")
sha256sums=('SKIP')
function pkgver() {
	cd rss-cli
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
function build() {
	cd rss-cli
	make
}
function package() {
	cd rss-cli
	install -Dm755 bin/rss-cli "$pkgdir/usr/bin/rss-cli"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
