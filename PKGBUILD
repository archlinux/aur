# Maintainer: Ebrahim Azarisooreh <ebrahim.azarisooreh@gmail.com>

_pkgnum=3180
pkgname=logtalk
pkgver=3.18.0
pkgrel=1
pkgdesc='Object-Oriented Logic Programming Language'
arch=('x86_64' 'i686')
url='http://logtalk.org/'
license=('APACHE')
depends=('bash')
makedepends=()
optdepends=(
	'swi-prolog: Prolog backend for logtalk'
	'gprolog: Prolog backend for logtalk'
	'yap: Prolog backend for logtalk'
)
source=("https://github.com/LogtalkDotOrg/logtalk3/archive/lgt${_pkgnum}stable.tar.gz")
sha256sums=('88b0bd2d426eec6add81580002c1709efc3c4b3423121d19587c03ab4cafec85')
conflicts=()
provides=('logtalk')
install=logtalk.install


package() {
	LOGTALKPREFIX="$pkgdir/usr/lib/$pkgname"
	mkdir -p "$LOGTALKPREFIX"
	mkdir -p "$pkgdir/usr/bin"

	cd "logtalk3-lgt${_pkgnum}stable"

	scripts/install.sh -p "$LOGTALKPREFIX" > /dev/null 2>&1

	for file in $LOGTALKPREFIX/bin/*; do
		cp $file $pkgdir/usr/bin
	done

	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
