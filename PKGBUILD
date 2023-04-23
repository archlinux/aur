# Maintainer: Matthias Debus <psic4t at data dot haus>

pkgname=qcard
pkgver=0.7.1
pkgrel=1
pkgdesc='Console-based quick addressbook for CardDAV'
arch=('x86_64')
url='https://git.sr.ht/~psic4t/qcard'
license=('GPL')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~psic4t/qcard/archive/${pkgver}.tar.gz")
sha512sums=('38628532bdd8000f089cb17090bc012b4a4ba0163f642e984663b8d6eb523ed212a6f9f4776f0a6a0145395ceae0997bfcf3d0ff2d556fefa5737c285466b3a6')

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
