# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=pyautosplit-git
pkgver=r40.f5749b2
pkgrel=1
pkgdesc="Autosplitter for Linux (for the LiveSplit Server)"
arch=('any')
url="https://github.com/christofsteel/pyautosplit"
license=('Apache')
groups=()
depends=("python-simpleeval" "python-ptrace" "python-eventlet")
makedepends=("python-setuptools" "git")
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+$url.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --tags 2>/dev/null | sed 's/^v-\?//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
