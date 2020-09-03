# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ice
pkgver=6.0.8+22+g6c2f781
pkgrel=1
pkgdesc="Tool to create Chromium/Chrome/Firefox/Vivaldi SSBs in Peppermint OS."
arch=('any')
url="https://github.com/PizzaLovingNerd/ice"
license=('GPL')
depends=('python-gobject' 'python-requests' 'python-beautifulsoup4')
makedepends=('git')
optdepends=('brave' 'chromium' 'google-chrome' 'epiphany' 'vivaldi')
provides=("$pkgname-ssb")
conflicts=("$pkgname-ssb")
#source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
#sha256sums=('978efb2fb8447fd1dc95eb5c94bff872afe1e43e9a695eef77f2688d82ff90b0')
_commit=6c2f78186cd02c7c7cde0db890cefadbf806cad0
source=("git+https://github.com/PizzaLovingNerd/ice.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's/brave-browser/brave/g' "usr/bin/$pkgname"
	sed -i 's/google-chrome/google-chrome-stable/g' "usr/bin/$pkgname"
	sed -i 's/chromium-browser/chromium/g' "usr/bin/$pkgname"
	sed -i 's/epiphany-browser/epiphany/g' "usr/bin/$pkgname"
}

package() {
	cd "$srcdir/$pkgname"
	cp -r usr "$pkgdir"
}
