# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>
pkgname=headsetcontrol-git
pkgver=r86.3979f9b
pkgrel=1
pkgdesc="Sidetone support for Logitech G930, G430 and Corsair VOID (Pro) in Linux and MacOSX"
arch=('x86_64')
url="https://github.com/Sapd/HeadsetControl"
license=('GPL')
depends=('hidapi')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/Sapd/HeadsetControl.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}/src"
	cmake ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/src"
	make DESTDIR="$pkgdir/" install
	ln -s /usr/local/bin/HeadsetControl ${pkgdir}/usr/local/bin/headsetcontrol
	install -m644 ../udev/*.rules ${pkgdir}/etc/udev/rules.d/
}
