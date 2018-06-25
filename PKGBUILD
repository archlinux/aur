# Maintainer: Georg Nagel <g.schlmm at gmail dot com>
# Contributor: Danilo Bargen <aur at dbrgn dot ch>
_pkgname=ti
pkgname=ti-git
pkgver=r153.bfb0a95
pkgrel=3
pkgdesc="A silly simple time tracker"
arch=('any')
url="https://pypi.org/project/ti/"
license=('MIT')
groups=()
depends=('python' 'python-yaml' 'python-colorama')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+https://github.com/tbekolay/ti")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname%}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
