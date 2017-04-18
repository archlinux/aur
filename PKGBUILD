# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

pkgname="qotd-git"
pkgver=0.10.6_1_g601e01e.601e01e
pkgrel=1
pkgdesc="A simple RFC 865-compliant QOTD (quote of the day) daemon. (git version)"
arch=('any')
url="https://gitlab.com/ammongit/${pkgname%-git}"
license=('GPL')
depends=()
makedepends=('git' 'gcc' 'ghostscript' 'gzip')
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!zipman')
install="$pkgname.install"
source=("git+https://gitlab.com/ammongit/${pkgname%-git}.git")
sha256sums=('SKIP')
backup=('etc/qotd.conf')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	local _ver="$(git describe --tags | sed 's/-/_/g')"
	printf '%s.%s' "${_ver:1}" "$(git describe --always)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make ROOT="$pkgdir" SYSTEMD=1 install
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}

# vim: set sw=4 ts=4 noet:
