# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=makerom-git
pkgver=r337.400a68e
pkgrel=1
pkgdesc="creates CTR cxi/cfa/cci/cia files for 3ds"
arch=('i686' 'x86_64')
url="https://github.com/3DSGuy/Project_CTR"
license=('MIT')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('ctr::git+https://github.com/3DSGuy/Project_CTR')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/ctr/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/ctr/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/ctr/${pkgname%-git}"
	install -D LICENSE "$pkgdir/usr/share/licenses/${pkgname-git}/LICENSE"
	install -Dm755 makerom "$pkgdir/usr/bin/${pkgname%-git}"
}
