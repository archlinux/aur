# Maintainer: Scott Hansen (firecat53) tech at firecat53 dot net
pkgname=urlscan-git
_gitname=urlscan
pkgver=r251.1c15a8c
pkgrel=1
pkgdesc="Replacement for urlview with html context and other improvements."
arch=('any')
url="https://github.com/firecat53/urlscan"
license=('GPL-2.0-or-later')
conflicts=('urlscan')
provides=('urlscan')
depends=('python' 'python-urwid')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
optdepends=('xdg-utils: open URLs with the default browser'
            'xsel: clipboard support (X11)'
            'xclip: clipboard support (X11)'
            'wl-clipboard: clipboard support (Wayland)')
source=('git+https://github.com/firecat53/urlscan.git')
md5sums=('SKIP')
install=urlscan.install

prepare() {
  git -C "$_gitname" clean -dfx
}

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitname"
    python -m build --wheel --no-isolation
}

package() {
  cd "$_gitname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
