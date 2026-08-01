# Maintainer: Vincent Schult <viboschu@gmail.com>

pkgname=voe-dl-git
pkgver=1.9.0.r0.g8d27ec3
pkgrel=1
pkgdesc="A Python-based downloader for videos hosted on voe.sx."
arch=('any')
url="https://github.com/MPZ-00/voe-dl"
license=(GPL-3.0-only)

depends=(
  python
  python-requests
  python-beautifulsoup4
  yt-dlp
  python-wget
)

makedepends=(
  git	
  python-build
  python-hatchling
  python-pip
)

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver(){
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package(){
  cd "$srcdir/${pkgname%-git}"

  python -m pip install --root="$pkgdir" --prefix=/usr --no-deps --no-index --find-links=dist --ignore-installed --no-compile --root-user-action=ignore voe-dl
}
