# Maintainer: Jason Papakostas <vithos@gmail.com>

pkgname=passmark-performancetest-bin
pkgver=v10.2.1001
pkgrel=1
pkgdesc="PassMark PerformanceTest Linux - Fast, easy to use, Linux system speed testing and benchmarking."
arch=('x86_64')
url="https://www.passmark.com/products/pt_linux/"
license=('custom')
depends=('ncurses5-compat-libs' 'curl')
changelog=CHANGELOG
source=("pt_linux_x64_$pkgver.zip::https://www.passmark.com/downloads/pt_linux_x64.zip")
sha256sums=('8307b7c1a2eb2e5642a6141a2e3424edd74a89ab1cb1915d3e9a9da62fe9c18b')

prepare() {
	cd "PerformanceTest" || exit

	# abort packaging if license changed
	[ "3a5466cf822921ff49ac704aedde345ea46b8b4efe465b137b2c1377bc1597c4  -" = "$(head -n7 readme.txt | sha256sum)" ] || exit 1

	# extract license
	head -n4 readme.txt >LICENSE
}

package() {
	cd "PerformanceTest" || exit

	install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D pt_linux_x64 "$pkgdir/usr/bin/passmark-performancetest"
}
