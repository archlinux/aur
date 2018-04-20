# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=streamcurse-git
pkgver=r19.b71ac57
pkgrel=1
pkgdesc="streamcurse is a curses stream launcher, inspired by gapatos livestreamer-curses"
arch=('any')
url="https://github.com/RadicalEd360/streamcurse"
license=('MIT')
depends=('streamlink')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
        python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
        python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
