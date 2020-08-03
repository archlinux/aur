# Maintainer: mcol <mcol at posteo dot net>

# PKGBUILD @ mcol.xyz/code/gita-git

pkgname=gita-git
pkgver=r8.43eb798
pkgrel=1
pkgdesc="Manage multiple git repos side by side for sanity 不疯了似地管理多个git库 "
url="https://github.com/nosarthur/gita"
arch=('any')
license=('GPL3')
source=("git+$url")
depends=('python-setuptools' 'python-yaml')
makedepends=('git' 'python-setuptools')
optdepends=()

sha256sums=('SKIP')
provides=("gita")

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
