# Maintainer: Matthias Debus <psic4t at data dot haus>

pkgname=qcal
pkgver=0.9.1
pkgrel=1
pkgdesc='Console-based quick calendar for CalDAV'
arch=('x86_64')
url='https://git.sr.ht/~psic4t/qcal'
license=('GPL')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~psic4t/qcal/archive/${pkgver}.tar.gz")
sha512sums=('bcd457d4b07062e0423d9efda7c50a476a23ae683d06be13ec2bf9c1136af67f7a62dce64b54c3debed06750f938234dc5cef0d8a2a93fcf71e30577f27280db')

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
