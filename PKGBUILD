# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=2.7.2
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('c2014b16165bf5f8bdadf42bb60ea967a060753c17e13a7c3569d16d218bb3fb644e6a46950e9e7b3aa5a9f6bee4da9b158694909a0ab1fe390b7bb4dc20b303'
            '076fc464dd6c3825707bf75b413357bfe3ebe340c4ff8350da36ef6b33fdbcba00ffbcb16991d853bd9179a72befc94105241e0384a7d463c5807f2fada5b975')
sha256sums=('c017a6c0482cf7c4a2b31dae1f406028017a5e939d98dd6c78aa94ce3ecc8d38'
            '487152d9585a9d39b7bc845c7b7b50c93ad23e1ffd0169c2a58590c2d1f91105')
validpgpkeys=('E2A30324A4465A4D5882692EC08038BDF280D33E')
CFLAGS="-flto -O3 $CFLAGS"

build() {
	cd "bc-$pkgver"
	PREFIX=/usr ./configure.sh -GP
	make
}

check() {
	cd "bc-$pkgver"
	make check
}

package() {
	cd "bc-$pkgver"
	DESTDIR="$pkgdir/" make install
}
