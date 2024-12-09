# Maintainer: Francisco Carpio <carpiofj at gmail dot com>
pkgname=alpaca-git
_pkgname=Alpaca
pkgver=2.9.0.r11.g9df5836
pkgrel=1
pkgdesc="An Ollama client made with GTK4 and Adwaita"
arch=('any')
url="https://github.com/jeffser/Alpaca"
license=('GPL-3.0')
makedepends=('meson')
depends=(
  'python-requests'
  'python-pillow'
  'python-pypdf'
  'python-pytube'
  'python-html2text'
  'python-pydbus'
  'python-youtube-transcript-api'
  'vte4'
)
optdepends=(
  'ollama'
)
conflicts=('alpaca-ai')
source=("git+https://github.com/jeffser/$_pkgname.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  meson setup _build
  meson compile -C _build
}

package() {
  cd "$srcdir/$_pkgname/_build"
  sudo meson install --destdir="$pkgdir"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
