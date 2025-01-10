# Maintainer: Bill Sideris <bill88t@bredos.org>

pkgname=nhentai-git
pkgver=r669.d74fd10
pkgrel=1
pkgdesc='CLI tool for downloading doujinshi from nhentai.net'
arch=(any)
url=https://github.com/RicterZ/"${pkgname%-*}"
license=('MIT')

depends=(python-requests python-soupsieve python-beautifulsoup4 python-tabulate python-iso8601 python-httpx python-pip)
makedepends=(git python-build python-installer python-wheel python-poetry)

provides=({,python-}"${pkgname%-*}")
conflicts=("${provides[@]}" python-$pkgname)
source=(git+https://github.com/RicterZ/"${pkgname%-*}".git)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-*}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-*}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
