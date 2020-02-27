# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=ai-dungeon-cli-git
pkgver=r46.f253c37
pkgrel=1
pkgdesc="Play ai dungeon on your terminal"
arch=('any')
url="https://github.com/Eigenbahn/ai-dungeon-cli"
license=('MIT')
groups=()
depends=("python-requests" "python-yaml")
makedepends=("python-setuptools")
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
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$pkgname"

	python setup.py build
}

package() {
	cd "$pkgname"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
