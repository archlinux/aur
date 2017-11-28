# Maintainer: Pochang Chen <johnchen902@gmail.com>

pkgname=python-jautolock-git
pkgver=1.0.r0.da2de08
pkgrel=1
pkgdesc="An automatic X screen-locker/screen-saver"
license=("GPL3")
arch=('any')
url="https://github.com/johnchen902/python-jautolock"
makedepends=('git' 'python-setuptools')
depends=('python' 'python-xdg' 'python-xlib')
conflicts=('jautolock' 'python-jautolock')
provides=('python-jautolock')
source=('git+https://github.com/johnchen902/python-jautolock.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    python setup.py build
}

check() {
	cd "$srcdir/${pkgname%-git}"
    python setup.py test
}

package() {
	cd "$srcdir/${pkgname%-git}"
    python setup.py install -O1 --root="$pkgdir"
    install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
