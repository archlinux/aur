# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org
pkgname=pysensors-git
pkgver=r48.c8976ab
pkgrel=1
pkgdesc="Easy hardware health monitoring in Python for Linux systems"
arch=('x86_64')
url="https://github.com/bastienleonard/pysensors"
license=('custom')
depends=('lm_sensors' 'python')
makedepends=('git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
        python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
        export PYTHONHASHSEED=0
        python setup.py install --root="$pkgdir" --optimize=1
        install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
