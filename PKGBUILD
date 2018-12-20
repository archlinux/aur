# Maintainer: antonbutanaev@gmail.com
pkgname=udptunnel-git
pkgver=r8.546bcbb
pkgrel=1
pkgdesc='Tunnel TCP via UDP'
arch=('i686' 'x86_64' 'armv6h')
url='https://github.com/antonbutanaev/udptunnel'
license=('GPL3')
depends=('glibc')
makedepends=('git' 'cmake')
provides=('udptunnel')
source=('git+https://github.com/antonbutanaev/udptunnel.git')
sha256sums=('SKIP')

pkgver() {
	cd udptunnel
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p udptunnel/build
	cd udptunnel/build
	cmake -DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd udptunnel/build
	make DESTDIR="$pkgdir/" install
}

