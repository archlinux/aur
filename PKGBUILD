# Maintainer: Matthias Debus <psic4t at data dot haus>

pkgname=qcal
pkgver=0.8.6
pkgrel=1
pkgdesc='Console-based quick calendar for CalDAV'
arch=('x86_64')
url='https://git.sr.ht/~psic4t/qcal'
license=('GPL')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~psic4t/qcal/archive/${pkgver}.tar.gz")
sha512sums=('37b0735392e270b6c25ea5ca3387946cd8c851e3e90b3dad42ca63369a54e1a7dfbfd99dd69e1a161ac1dde6f768bafc1bb1289c5f51479f3a5e7be41af8b383')

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
