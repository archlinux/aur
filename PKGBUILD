# Maintainer: Jesus Alvarez <jesusalv@rez.codes>
# Contributor: Yann Büchau <nobodyinperson at posteo de>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Hao Long <imlonghao@archlinuxcn.org>

pkgname=python-rich-rst-git
pkgver=1.1.7.r4.ge36049c
pkgrel=1
pkgdesc='Allows python-rich to print a reStructuredText document in a rich format'
arch=(any)
url='https://github.com/wasi-master/rich-rst'
license=('MIT')
depends=('python-rich' 'python-docutils')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
