# Maintainer: Matthias Debus <psic4t at data dot haus>

pkgname=qcal
pkgver=0.9.2
pkgrel=1
pkgdesc='Console-based quick calendar for CalDAV'
arch=('x86_64')
url='https://git.sr.ht/~psic4t/qcal'
license=('GPL')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~psic4t/qcal/archive/${pkgver}.tar.gz")
sha512sums=('fa122315b447a1414977fb2a464f940155f8d44128a53e99bf2969aeaf0793a12b9d35a2f65b4039c89e4d9b30f8156be54eed3b55cabe8cfd149c683d3de111')

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
