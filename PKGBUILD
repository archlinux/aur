# Maintainer: Matthias Debus <psic4t at data dot haus>

pkgname=qcard
pkgver=0.7.0
pkgrel=1
pkgdesc='Console-based quick addressbook for CardDAV'
arch=('x86_64')
url='https://git.sr.ht/~psic4t/qcard'
license=('GPL')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~psic4t/qcard/archive/${pkgver}.tar.gz")
sha512sums=('083e6f61f48aa143f1f5e9321549873ddb94ffaeb68191c49bbe75da18a0439ad2d1ddf2228b834393f967577ef5b91b425285d4dbdf5cfc57e680fb434f3e60')

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
