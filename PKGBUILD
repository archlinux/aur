# Maintainer: Evgeny Cherkashin <eugeneai@irnok.net>

pkgname=logtalk
pkgver=3.53.0
pkgrel=2
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
source=("https://logtalk.org/files/logtalk-${pkgver}.tar.bz2")
sha256sums=('31d59739f9bf125dc19b39ef059f0670a7234015b22fdab1918a9bef5c7f32b0')
conflicts=()
provides=('logtalk')
install=logtalk.install


package() {
	LOGTALKPREFIX="$pkgdir/usr/lib/$pkgname"
	mkdir -p "$LOGTALKPREFIX"
	mkdir -p "$pkgdir/usr/bin"

	cd "logtalk-${pkgver}"

	scripts/install.sh -p "$LOGTALKPREFIX" > /dev/null 2>&1

	for file in $LOGTALKPREFIX/bin/*; do
		cp $file $pkgdir/usr/bin
	done

	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
