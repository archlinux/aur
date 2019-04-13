# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-itchat-git
pkgver=r188.d5ce5db
pkgrel=1
pkgdesc='A complete and graceful API for Wechat.'
arch=('any')
url='https://github.com/littlecodersh/ItChat'
license=('MIT')
depends=('python-requests' 'python-pyqrcode' 'python-pypng')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}"::"git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root "$pkgdir"
	install -Dm644 "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
