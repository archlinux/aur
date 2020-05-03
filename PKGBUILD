# Maintainer: coldbug <coldBug@e.mail.de>
pkgname=python-mtp-git
pkgver=v1.0.r4.g1ab37bb
pkgrel=1
pkgdesc="Automated/interactive cryptanalysis for the Many-time pad attack"
arch=(any)
url="https://github.com/CameronLonsdale/MTP"
license=("GPL3")
depends=("python-urwid")
makedepends=("git")
provides=("${pkgname}")
source=("${pkgname%-git}::git+https://github.com/CameronLonsdale/MTP.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  sed -i 's/urwid==2.0.1/urwid/g' setup.py  
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
