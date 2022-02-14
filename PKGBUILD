# Maintainer: grialion <grialion@grial.tech>
pkgname=rpcpp-git
pkgver=r10.2a96ce8
pkgrel=1
pkgdesc='RPC++ is a tool for Discord RPC (Rich Presence) to let your friends know about your Linux system'
arch=('any')
url='https://github.com/grialion/rpcpp'
license=('MIT')
depends=('wget' 'unzip')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )

}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sh setup.sh
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
