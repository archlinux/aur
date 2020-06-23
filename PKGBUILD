# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=telegram-tg
pkgname=$_pkgname-git
pkgver=r299.73bb8b2
pkgrel=1
pkgdesc="terminal telegram client that really works"
arch=(any)
url="https://github.com/paul-nameless/tg"
license=('Unlicense')
depends=('python-telegram' 'python3')
makedepends=('git' 'python-dephell')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/paul-nameless/tg.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "$srcdir/$_pkgname"

	python3 setup.py build
}

package() {
	cd "$srcdir/$_pkgname"

	python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
