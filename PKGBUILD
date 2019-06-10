# Maintainer: cylgom <cylgom@gmail.com>
pkgname=ly-git
pkgver=v0.3.0.r0.g61fd099
pkgrel=1
pkgdesc="TUI display manager"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/cylgom/ly"
license=('custom:WTFPL')
makedepends=('git')
depends=('pam' 'xorg-xauth')
conflicts=('ly' 'python-ly-git')
source=('git+https://github.com/cylgom/ly.git')
md5sums=('SKIP')

pkgver() {
	cd ly
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd ly
	make github
}

build() {
	cd ly
	make
}

package() {
	cd ly
	make DESTDIR="$pkgdir" install
	install -D -m644 license.md "${pkgdir}/usr/share/licenses/${pkgname}/WTFPL"
}
