# Maintainer: Jeff Henson <jeff@henson.io>

pkgname=mobsh
pkgver=5.3.1
pkgrel=1
pkgdesc="Tool for smooth git handover"
arch=('x86_64' 'i686')
url="https://github.com/remotemobprogramming/mob"
license=('MIT')
depends=('glibc' 'git')
optdepends=('espeak-ng-espeak: Multi-lingual software speech synthesizer'
            'mbrola-voices-us1: An American English female voice for the MBROLA synthesizer')
makedepends=('go')
conflicts=('mob')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('225ae1e2769ad73f32f50e27a7df0bcc3fc3ae4489f4798acbe1d33ad3436c24')

build() {
	cd "mob-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o mob
}

package() {
	cd "mob-${pkgver}"
	install -vDm 755 mob -t "${pkgdir}/usr/bin/"
	install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
