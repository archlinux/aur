# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

_pkgname=qotd
pkgname="$_pkgname"
pkgver=0.7.2
pkgrel=1
pkgdesc="A simple RFC 865-compliant QOTD (quote of the day) daemon."
arch=('any')
url="https://gitlab.com/ammongit/$_pkgname"
license=('GPL')
depends=('glibc')
makedepends=('git' 'gcc' 'ghostscript' 'gzip')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!zipman')
install="$pkgname.install"
source=("https://gitlab.com/ammongit/qotd/repository/archive.tar.gz?ref=v$pkgver")
sha256sums=('SKIP')
backup=('etc/qotd.conf')

build() {
    cd "$srcdir/$_pkgname-v$pkgver"*

	# Compile sources
	make release
}

package() {
    cd "$srcdir/$_pkgname-v$pkgver"*

	# Install files
	make ROOT="$pkgdir" SYSTEMD=1 install
	install -D -m644 "doc/$_pkgname.pdf" "$pkgdir/usr/share/doc/$_pkgname/$_pkgname.pdf"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

