pkgname=playfin
pkgver=r94.b92d83f
pkgrel=1
pkgdesc="Terminal-based Jellyfin player with MPV integration"
arch=('any')
url="https://github.com/AlexJonker/playfin"
license=('MIT')
depends=('mpv' 'python' 'python-requests' 'python-dotenv')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/playfin"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}



prepare() {
  # Clean out old wheels etc.
  git -C "$srcdir/playfin" clean -dfx
}

build() {
  cd "$srcdir/playfin"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/playfin"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

