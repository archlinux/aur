# Maintainer: Evgeny Cherkashin <eugeneai@irnok.net>

pkgname=logtalk
pkgver=3.102.0
pkgrel=1
pkgdesc='Object-Oriented Logic Programming Language'
arch=('x86_64')
url='https://logtalk.org/'
license=('Apache-2.0')
depends=('bash')
makedepends=('swi-prolog')
optdepends=(
	'swi-prolog: Prolog backend for logtalk'
	'gprolog: Prolog backend for logtalk'
	'yap: Prolog backend for logtalk'
)
provides=('logtalk')
conflicts=()
source=("https://logtalk.org/files/logtalk-${pkgver}.tar.bz2")
sha256sums=('32813ad9ce4f99427fea3cdac04f49ae571b0bc2cd12360e5632c5eb98a8fd18')
install=logtalk.install

package() {
	mkdir -p "$pkgdir/usr/share"

	# The installer changes directory before using the prefix, so make it
	# absolute. It installs into <prefix>/share and creates its convenience
	# symlinks in <prefix>/bin.
	local prefix="$(realpath "$pkgdir")/usr"

	cd "logtalk-${pkgver}"

	scripts/install.sh -p "$prefix" > /dev/null

	rm -rf "$pkgdir/usr/share/man"

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m 644 "$pkgdir/usr/share/logtalk/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
