pkgname=certcheck-git
pkgver=r3.40bf78b
pkgrel=1
pkgdesc="CLI tool to check x.509 cert validity on a set of TLS/SSL servers"
arch=(any)
url="https://github.com/2ion/certcheck"
license=('GPL')
depends=('python>=3.2' python-pyopenssl python-termcolor python-terminaltables)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('certcheck::git+https://github.com/2ion/certcheck.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

check() {
	cd "$srcdir/${pkgname%-git}"
  python -m py_compile certcheck
}

package() {
	cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir"/usr/bin/
  install -m 755 -t "$pkgdir"/usr/bin/ certcheck
}
