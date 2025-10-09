# Maintainer: Matthias Debus <psic4t at data dot haus>

pkgname=qcard
pkgver=0.7.2
pkgrel=1
pkgdesc='Console-based quick addressbook for CardDAV'
arch=('x86_64')
url='https://git.sr.ht/~psic4t/qcard'
license=('GPL')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~psic4t/qcard/archive/${pkgver}.tar.gz")
sha512sums=('b2d1ec20fcd1c8112c188a763e267f1e8c7aa4c0777e49b259b84a0b38d324d481c175b7895bffca230e4d7bf0c7f76ffdfd8dc5d39ac11327daf53c8a3021d6')

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
