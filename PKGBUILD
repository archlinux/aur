# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=ai-dungeon-cli
pkgver=0.4.0
pkgrel=1
pkgdesc="Play ai dungeon on your terminal"
arch=('any')
url="https://github.com/Eigenbahn/ai-dungeon-cli"
license=('MIT')
groups=()
depends=("python-requests" "python-yaml" "python-gql")
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
sha256sums=('6fbcc5fa603ac52668145a86a11e238486a68e0021e297e8ed4e1d82b95e5eb9')

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
