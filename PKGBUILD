# Maintainer: André Almeida <andrealmeid@riseup.net>

pkgname=blktests-git
_pkgname=blktests
pkgrel=1
pkgver=r384.9e02419
pkgdesc="Linux kernel block layer testing framework"
arch=('any')
url="https://github.com/osandov/blktests"
license=('GPL2' 'GPL3')
depends=('fio')
makedepends=('git')
optdepends=('e2fsprogs: required for some tests'
	    'xfsprogs: required for some tests'
	    'multipath-tools: required for some tests'
	    'device-mapper: required for some tests')
source=('git://github.com/osandov/blktests.git')
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" prefix=/opt install
}
