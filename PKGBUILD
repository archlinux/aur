# Maintainer: Your Name <youremail@domain.com>
pkgname=pikchr
pkgver=1.0
pkgrel=1
pkgdesc="Pikchr (pronounced \"picture\") is a PIC-like markup language for diagrams in technical documentation."
arch=('any')
url="https://pikchr.org"
license=('0-clause-BSD')
makedepends=('make')
checkdepends=('xdg-utils')
provides=('pikchr')
source=("$pkgname-$pkgver.tar.gz::${url}/home/tarball/trunk/${pkgname}.tar.gz"
        "Makefile.patch")
sha256sums=('f4623761f8bfb2443cb6e7830439e8230508d033ddf39c2c333a6d261fc87180'
            '01270058bf34befe56d2e1b845a6b05d7c40381b902331b186325577cd1b7552')

prepare() {
	cd "$pkgname"
	patch -i "$srcdir/Makefile.patch"
}

build() {
	cd "$pkgname"
	make
}

check() {
	cd "$pkgname"
	make -k test
}

package() {
	cd "$pkgname"
    install -Dm755 "./$pkgname" "${pkgdir}/usr/bin/${pkgname}"
}
