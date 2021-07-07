# Maintainer: igo95862
pkgname='python-typeshed-git'
pkgver=r4608.9d5046ee7
pkgrel=1
pkgdesc="Python typing stubs"
arch=('any')
url="https://github.com/python/typeshed/"
license=('Apache')
depends=('python')
makedepends=('git')
provides=("python-typeshed")
conflicts=("python-typeshed")
source=(
    "${pkgname}::git+https://github.com/python/typeshed.git"
    'install_typeshed.py'
)
md5sums=(
    'SKIP'
    'SKIP'
)

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
