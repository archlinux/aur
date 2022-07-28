# Maintainer: Brod8362 <brod8362@gmail.com>

pkgname=d4m-git
_pkgname=${pkgname%-git}
pkgver=r124.402ef8a
pkgrel=00
pkgdesc="Project Diva MegaMix+ mod manager"
arch=('any')
license=('MIT')
url='https://github.com/brod8362/d4m'
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
depends=(
    'libarchive'
    'pyside6'
    'python-requests'
    'python-colorama'
    'python-toml'
    'python-simple-term-menu'
    'python-vdf'
    'python-libarchive'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-pip'
    'git'
    'python-setuptools'
    'python-setuptools-scm'
)

pkgver() {
  cd "$srcdir/$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    python -m build --no-isolation
}

package() {
    cd "$srcdir/$pkgname"

    install -D resources/logo.svg "$pkgdir/usr/share/pixmaps/d4m.svg"
    install -D aur/d4m.desktop "$pkgdir/usr/share/applications/d4m.desktop"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
