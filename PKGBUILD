# Maintainer: Vincent Schult <viboschu@gmail.com>

pkgname=voe-dl-git
_srcname=voe-dl-p4ul17
pkgver=1.9.0.r2.gb82c920
pkgrel=2
pkgdesc="A Python-based downloader for videos hosted on voe.sx."
arch=('any')
url="https://github.com/p4ul17/voe-dl"
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

source=("${_srcname}::git+$url.git")
sha256sums=('SKIP')

pkgver(){
  cd "$srcdir/${_srcname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_srcname}"
  python -m build --wheel --no-isolation
}

package(){
  cd "$srcdir/${_srcname}"

  python -m pip install --root="$pkgdir" --prefix=/usr --no-deps --no-index --find-links=dist --ignore-installed --no-compile --root-user-action=ignore voe-dl
}
