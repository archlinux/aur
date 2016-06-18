# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

_pkgname=qotd
pkgname=$_pkgname-git
pkgver=0.4.0_33_g82d4b2b.82d4b2b
pkgrel=1
pkgdesc="A simple QOTD (quote of the day) daemon."
arch=('any')
url="https://gitlab.com/ammongit/$_pkgname"
license=('GPL')
depends=()
makedepends=('git' 'gcc')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
options=()
install="$pkgname.install"
source=("git+https://gitlab.com/ammongit/$_pkgname.git")
sha256sums=('SKIP')
backup=('etc/qotd.conf')

pkgver() {
	cd "$srcdir/$_pkgname"
    _ver="$(git describe --tags | sed 's/-/_/g')"
    printf '%s.%s' "${_ver:1}" "$(git describe --always)"
}

build() {
    cd "$srcdir/$_pkgname"
	make release
}

package() {
    cd "$srcdir/$_pkgname"
	make ROOT="$pkgdir" install
	install -D -m644 "doc/$_pkgname.pdf" "$pkgdir/usr/share/doc/$_pkgname/$_pkgname.pdf"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

