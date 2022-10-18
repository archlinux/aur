# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-maxvolpy-git
pkgver=0.3.8r24.55cf40c
pkgrel=1
pkgdesc='Constructing different low-rank skeleton and cross approximations'
arch=('x86_64')
url='https://bitbucket.org/muxas/maxvolpy'
license=('MIT')
groups=()
depends=('python-numpy' 'python-scipy')
makedepends=('cython' 'git' 'python-numpy' 'python-pip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('python-maxvolpy::git+https://bitbucket.org/muxas/maxvolpy.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    output=$(python -c 'from maxvolpy.__version__ import __version__; print(__version__)')
    version=$(echo "$output" | tail -n 1)
    rev_num=$(git rev-list --count HEAD)
    rev_hash=$(git rev-parse --short HEAD)
	printf "%sr%s.%s" $version $rev_num $rev_hash
}

package() {
	cd "$srcdir/${pkgname%-git}"
    pip install --no-deps --root "${pkgdir}" .
    find "${pkgdir}" -name "setup.py" -delete
    find "${pkgdir}" -name "setup.*.pyc" -delete
}
