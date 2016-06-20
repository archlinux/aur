# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

_pkgname=qotd
pkgname="$_pkgname"
pkgver=0.5.0
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
options=()
install="$pkgname.install"
source=("git+https://gitlab.com/ammongit/$_pkgname.git")
sha256sums=('SKIP')
backup=('etc/qotd.conf')

build() {
    cd "$srcdir/$_pkgname"

	# Go to the correct commit for this release
	git reset --hard "$(git rev-parse "v$pkgver")"

	# Compile sources
	make release
}

package() {
    cd "$srcdir/$_pkgname"
	make ROOT="$pkgdir" SYSTEMD=1 install
	install -D -m644 "doc/$_pkgname.pdf" "$pkgdir/usr/share/doc/$_pkgname/$_pkgname.pdf"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

