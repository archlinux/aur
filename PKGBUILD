# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=ai-dungeon-cli
pkgver=0.3.1
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
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('fd2d285ba789547004a1020e836c83c16dbb33e49d17c738a8c08441c25eddda')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	# setuptools-git-version can't work outside a git repo.
	sed -i \
		-e "s/version_format.*/version=\"$pkgver\",/" \
		-e "s/setup_requires.*//" setup.py
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
