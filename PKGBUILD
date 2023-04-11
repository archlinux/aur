# Maintainer: Yuannan Lin [https://gitlab.com/yuannan] <yuannan@pm.me>

pkgname=yamr
pkgver=0.0.0.1
pkgrel=1
pkgdesc='Yet Another Mirror Ranker. The fastest mirror ranker!⁺ A fast mirrorlist in seconds!'
arch=('any')
url='https://gitlab.com/yuannan/yamr'
license=('GPL3')
depends=('geoip')
conflicts=()
source=("https://gitlab.com/yuannan/yamr")
sha256sums=('SKIP')

build() {
	cd yamr
	git submodule init
	git submodule update
	./clean_build.sh
}

test_out_path="/tmp/yamr.mirrorlist"
check() {
	if [ -e $test_out_path ]; then
		cat $test_out_path
	else
		echo "No test output detected at: " $test_out_path
		return -1
	fi
}

package() {
	install -Dm 755 "$srcdir/$pkgname/build/yamr" "$pkgdir/usr/bin/$pkgname"
}
