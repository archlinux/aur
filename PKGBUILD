# Maintainer: Ian Laird <irlaird@gmail.com>
pkgname=nenobacklight-git
pkgver=r1.d6fe5f0
pkgrel=1
pkgdesc="A command-line tool for managing the backlight settings of your system."
arch=('any')
url="https://github.com/en0/nenobacklight"
license=('MIT')
makedepends=(
    git
    make
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://github.com/en0/nenobacklight.git)
options=(strip !debug)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    make clean nenobacklight
}

package() {
	cd "$srcdir/${pkgname%-git}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm755 nenobacklight ${pkgdir}/usr/bin/${pkgname%-git}
}
