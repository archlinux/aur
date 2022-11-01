# Maintainer: Lancia Greggori <lanciagreggori@gmail.com>

pkgname='herbe-git'
pkgver='1.0.0.r10.gdec89e4'
pkgrel='3'
pkgdesc='Daemon-less notifications without D-Bus'
arch=('x86_64')
url='https://github.com/dudik/herbe'
license=('MIT')
depends=('libx11' 'libxft')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	make clean all
}

package() {
	cd "$pkgname"
	make PREFIX='/usr' DESTDIR="$pkgdir/" install
	install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
