# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=tt
pkgver=0.4.1
pkgrel=1
pkgdesc="Terminal based typing test"
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64' )
url="https://github.com/lemnos/tt"
license=('MIT')
depends=(
	'glibc'
)
makedepends=(
	'go'
	'git'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d42928da6dc3480613e1ecb81506fd4accbe22ef3dfb75b46d1e9471f24e6b5fcc47643de422d88093e03663340bfd3f01e3ad9ca48cea320ed9e6064d6fd14c')

build() {
	export local CGO_CPPFLAGS="${CPPFLAGS}"
	export local CGO_CFLAGS="${CFLAGS}"
	export local CGO_CXXFLAGS="${CXXFLAGS}"
	export local CGO_LDFLAGS="${LDFLAGS}"
	export local GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	make all
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX='/usr' install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
