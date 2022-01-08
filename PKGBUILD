# Maintainer: igo95862
pkgname='python-typeshed-git'
pkgver=r5417.950cff21f
pkgrel=1
pkgdesc="Python typing stubs"
arch=('any')
url="https://github.com/python/typeshed/"
license=('Apache')
depends=('python')
makedepends=('git')
provides=("python-typeshed" "python-types-setuptools")
conflicts=("python-typeshed" "python-types-setuptools")
source=(
    "${pkgname}::git+https://github.com/python/typeshed.git"
    'install_typeshed.py'
)
optdepends=(
    'mypy: Python type checker'
)
sha512sums=('SKIP'
            'b87fe938f93da2665643a84a6c35473240732421a6271f503efe5aae7423e04bd773b1aa5943883d13872450b88ed034c98294bd2c410a8d4a73d6aa9ca3e6a9')

pkgver() {
    cd "$srcdir/${pkgname}"
    # Git, no tags
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir"
    python3 -I ./install_typeshed.py \
        --typeshed-dir "$srcdir/${pkgname}" \
        --install-dir "$pkgdir"
}
