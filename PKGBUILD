# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgbase=mcp-handley-lab
pkgname=mcp-handley-lab-git
pkgver=r150.1c36599
pkgrel=1
pkgdesc="Comprehensive MCP framework for Handley Research Group - productivity tools, scientific computing, and lab administration"
arch=(any)
url="https://github.com/handley-lab/mcp-handley-lab"
license=(MIT)
depends=(
    python
    python-pip
)
makedepends=(git python-build python-installer python-setuptools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
