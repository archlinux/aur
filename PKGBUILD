# Maintainer: Kai Michaelis <seu@das-labor.org>
pkgname=sequoia-git
pkgver=675
pkgrel=1
pkgdesc="A modular OpenPGP library"
arch=('x86_64' 'i686')
url="https://sequoia-pgp.org/"
license=('GPL3')
groups=('devel')
depends=(
  'nettle>=3'
  'sqlite>=3'
  'openssl>=1.1')
makedepends=(
    'rust'
    'cargo'
    'git>=1')
provides=('sequoia')
conflicts=('sequoia')
source=($pkgname::git+https://gitlab.com/sequoia-pgp/sequoia.git)
md5sums=('SKIP')

pkgver() {
    cd $pkgname
    echo "$(git rev-list --count HEAD)"
}

build() {
    cd $pkgname
    cargo build --all --release
}

package() {
	cd $pkgname
	install -d -m755 "$pkgdir/usr/bin"
	install -D -s -m555 "$srcdir/$pkgname/target/release/sq" "$pkgdir/usr/bin/sq"
	install -D -s -m555 "$srcdir/$pkgname/target/release/sqv" "$pkgdir/usr/bin/sqv"
	install -d -m755 "$pkgdir/usr/lib/sequoia"
	install -D -s -m555 "$srcdir/$pkgname/target/release/sequoia-public-key-store" "$pkgdir/usr/lib/sequoia/sequoia-public-key-store"
}
