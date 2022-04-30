# Maintainer: Matthias Debus <psic4t at data dot haus>

pkgname=qcard
pkgver=0.5.0
pkgrel=2
pkgdesc='Console-based quick addressbook for CardDAV'
arch=('x86_64')
url='https://git.sr.ht/~psic4t/qcard'
license=('GPL')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~psic4t/qcard/archive/${pkgver}.tar.gz")
sha512sums=('aaa7fe3c192926ea0ce94422b6cf4ac745466899267d54599a375fe0d5690e812a27869e2984e87687d3e2f03e1620c3d2016b30e4e8fd9ed07c9f835f2f10d1')

build() {
	cd ${pkgname}-${pkgver}
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath"
	make
}

package() {
	cd ${pkgname}-${pkgver}
	install -Dm755 qcard "$pkgdir/usr/bin/qcard"
	install -Dm644 config-sample.json "$pkgdir"/usr/share/doc/"${pkgname}"/config-sample.json
	install -Dm644 README.md "$pkgdir"/usr/share/doc/"${pkgname}"/README.md
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/LICENSE
}
