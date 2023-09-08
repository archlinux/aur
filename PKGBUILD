# Maintainer: José Ronaldo <tecladin@proton.me>
pkgname='slide-git'
pkgver='r14.10480d8'
pkgrel=1
pkgdesc="Center text in the middle of the terminal."
arch=('x86_64')
url="https://github.com/Tecladin/slide"
license=('GPL3')
depends=('glibc')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::git+$url.git)
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "${pkgdir}/usr/bin"
	make DESTDIR="$pkgdir/usr/bin" install
}
