# Maintainer: Tudor Roman <tudurom@gmail.com>

pkgname=thinglaunch-git
pkgver=2.4.r11.gd67511b
pkgrel=1
pkgdesc="A simple command and password prompter for X11"
arch=("i686" "x86_64" "armv7h" "aarch64")
url="http://r-36.net/scm/thinglaunch/"
provides=("thinglaunch")
license=("ISC")
depends=("libx11")
makedepends=("git")
source=("$pkgname::git://r-36.net/thinglaunch")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
