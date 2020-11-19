# Maintainer: Deepjyoti <deep.barman30@gmail.com>
pkgname=python-youtube-search-git

pkgver() {
  cd "youtube_search-master"
    printf '%s.r%s.%s' \
    "$(grep version= setup.py | sed 's/^\s*version="\(.*\)".*/\1/')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=1.1.1.r4.d199773
pkgrel=1

pkgdesc="Perform YouTube video searches without the API"
arch=("any")
url="https://github.com/joetats/youtube_search"
license=('MIT')
depends=(
		"python>=3.6"
		"python-requests"
		)
makedepends=("git" "python-setuptools")
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/joetats/youtube_search/archive/master.zip")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "youtube_search-master"
	python3 setup.py build
}

package() {
	cd "youtube_search-master"
	python3 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
