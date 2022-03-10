# Maintainer: artemtech <sofyanartem@gmail.com>

pkgname=citramanik-qt-git
pkgver=1.3.2.r23.dc93b39
pkgrel=1
pkgdesc="Your next way to export your Inkscape work for all purpose quickly"
arch=("x86_64")
url="https://citramanik.dev-is.my.id"
license=("GPLv3")
provides=("citramanik-qt-git")
conflicts=("citramanik-qt-bin")
replaces=("citramanik-qt-bin")
depends=("python-pyqt5"
         "python-appdirs"
         "python-lxml"
         "python-pillow"
         "inkscape"
         "ghostscript")
makedepends=("git" "python-setuptools")
source=("$pkgname::git+https://github.com/devlovers-id/citramanik-qt")
md5sums=("SKIP")

pkgver() {
	cd "${pkgname}"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "%s.r%s.%s" "$(git describe --tags `git rev-list --tags --max-count=1`)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd $srcdir/$pkgname
	python setup.py build
}

package() {
	cd $srcdir/$pkgname
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

