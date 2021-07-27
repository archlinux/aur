# Maintainer: Deepjyoti <deep.barman30@gmail.com>
pkgname=youtube-search-python-git

pkgver() {
  cd "youtube-search-python"
    printf '%s.r%s.%s' \
    "$(grep version= setup.py | sed 's/^\s*version="\(.*\)".*/\1/')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=1.4.6.r116.539137a
pkgrel=1

pkgdesc="Search for YouTube videos, channels & playlists & get video information using link WITHOUT YouTube Data API v3"
arch=("any")
url="https://github.com/alexmercerind/youtube-search-python"
license=('MIT')
depends=(
		"python>=3.6"
		"httpx"
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
source=("git+https://github.com/alexmercerind/youtube-search-python.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "youtube-search-python"
	python3 setup.py build
}

package() {
	cd "youtube-search-python"
	python3 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
