# Maintainer: Ebrahim Azarisooreh <ebrahim.azarisooreh@gmail.com>

_pkgnum=3170
pkgname=logtalk
pkgver=3.17.0
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
sha256sums=('012463d97d15cad542a8c701b5e897b6562407c8ab7ab40021afac309db13d67')
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
