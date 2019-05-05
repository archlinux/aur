# Maintainer: Ebrahim Azarisooreh <ebrahim.azarisooreh@gmail.com>

_pkgnum=3250
pkgname=logtalk
pkgver=3.25.0
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
sha256sums=('8a185f4a6dbc3b0b322595d82f194bbd397ca70dc772af5ac62694e741ee1270')
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
