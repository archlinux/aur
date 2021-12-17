# Maintainer: Dennis Stengele <dennis@schuppentier.org>
pkgname=pdns-cli-git
pkgver=r47.d1a6d3c
pkgrel=1
pkgdesc="A PowerDNS HTTPS API client implementation in Python"
arch=("any")
url="https://github.com/catalyst/pdns-cli"
license=('GPL')
groups=()
depends=(
    python-requests
    python-argcomplete
    python-toml
    python-colored
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('pdns-cli::git+https://github.com/dstengele/pdns-cli') # My fork until setuptools PR is merged
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir" --optimize=1
}
