# Maintainer: Siddhesh Dharme <siddheshdharme18@gmail.com>

_pkgname=sstv
pkgname="$_pkgname-git"
pkgver=r48.3e556ee
pkgrel=1
pkgdesc='SSTV audio file decoder'
arch=(any)
url='https://github.com/colaclanth/sstv'
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-numpy'
    'python-pillow'
    'python-soundfile'
    'python-scipy'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
)
source=("git+https://github.com/colaclanth/$_pkgname")
b2sums=('SKIP')

prepare() {
    git -C "$srcdir/$_pkgname" clean -dfx
}

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    python -m build --wheel --no-isolation 
}

package() {
    cd "$srcdir/$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
