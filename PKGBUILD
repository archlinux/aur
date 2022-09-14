# Maintainer: Matthias Debus <psic4t at data dot haus>

pkgname=qcal
pkgver=0.8.9
pkgrel=1
pkgdesc='Console-based quick calendar for CalDAV'
arch=('x86_64')
url='https://git.sr.ht/~psic4t/qcal'
license=('GPL')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~psic4t/qcal/archive/${pkgver}.tar.gz")
sha512sums=('b047591f9d9cadbbb009c0f2d3f601624a5dc4c70f9a3f20b22f02e41eac45cb61043633f6f3922acf4ea4810cb4ced2fb546195c27d6296c025f6d1478d738a')

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
	install -Dm755 qcal "$pkgdir/usr/bin/qcal"
	install -Dm644 config-sample.json "$pkgdir"/usr/share/doc/"${pkgname}"/config-sample.json
	install -Dm644 README.md "$pkgdir"/usr/share/doc/"${pkgname}"/README.md
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/LICENSE
}
