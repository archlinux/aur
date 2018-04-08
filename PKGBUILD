# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

pkgname=qotd
pkgver=0.12.0
pkgrel=1
pkgdesc="A simple RFC 865-compliant QOTD (quote of the day) daemon."
arch=('any')
url="https://github.com/ammongit/$pkgname"
license=('GPL')
depends=()
makedepends=('git' 'gcc' 'ghostscript' 'gzip')
optdepends=()
provides=("$pkgname")
conflicts=("$pkgname")
options=('!zipman')
install="$pkgname.install"
source=("https://github.com/ammongit/qotd/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
backup=('etc/qotd.conf')

build() {
	cd "${pkgname%-git}-${pkgver}"

	# Compile sources
	make release
}

package() {
	cd "${pkgname%-git}-${pkgver}"

	# Install files
	make ROOT="$pkgdir" SYSTEMD=1 install
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim: set sw=4 ts=4 noet:
