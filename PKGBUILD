# Maintainer: fengkx <liangkx8237@gmail.com>
pkgname=freedns-go-git 
pkgname_raw=freedns-go
pkgver=r71.9977496
pkgrel=1
pkgdesc="Optimized DNS Server for Chinese users."
arch=(any)
url="https://github.com/tuna/freedns-go"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'go' 'python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/tuna/freedns-go.git')
md5sums=('SKIP')

pkgver() {
	cd "freedns-go"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
	cd "$srcdir/${pkgname_raw}"
	make update_db
}

build() {
	cd "$srcdir/${pkgname_raw}"
	make
}

package() {
	cd "$srcdir/${pkgname_raw}"
	osarch=$CARCH
	echo "$osarch"
	if [ "$osarch" == "x86_64" ]
	then
		osarch="amd64"
	fi
	mkdir -p "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -m +x "build/freedns-go-linux-$osarch" ${pkgdir}/usr/bin/freedns-go
}
