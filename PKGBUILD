# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

pkgname=qotd
pkgver=0.9.4
pkgrel=1
pkgdesc="A simple RFC 865-compliant QOTD (quote of the day) daemon."
arch=('any')
url="https://gitlab.com/ammongit/$pkgname"
license=('GPL')
depends=()
makedepends=('git' 'gcc' 'ghostscript' 'gzip')
optdepends=()
provides=("$pkgname")
conflicts=("$pkgname")
options=('!zipman')
install="$pkgname.install"
source=("https://gitlab.com/ammongit/qotd/repository/archive.tar.gz?ref=v$pkgver")
sha256sums=('SKIP')
backup=('etc/qotd.conf')

build() {
	cd "$srcdir/$pkgname-v$pkgver"*

	# Compile sources
	make release
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"*

	# Install files
	make ROOT="$pkgdir" SYSTEMD=1 install
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim: set sw=4 ts=4 noet:
