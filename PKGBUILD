# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=python-whenever-git
pkgdesc='Modern datetime library for Python'
pkgver=0.11.0.r12.g18402a1
pkgrel=1
url="https://github.com/ariebovenberg/whenever"
arch=(aarch64 x86_64)
license=(MIT)
depends=(
    glibc
    libgcc
    python
    python-pydantic-core
    python-tzlocal
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools-rust
    python-wheel
)
provides=(python-whenever)
conflicts=(python-whenever)
source=("python-whenever::git+https://github.com/ariebovenberg/whenever.git")
sha256sums=('SKIP')

pkgver() {
    cd "python-whenever"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "python-whenever"
    export PYTHONWARNINGS=ignore
    python -m build --wheel --no-isolation
}

package() {
    cd "python-whenever"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm0644 -t "$pkgdir/usr/share/doc/python-whenever" {CHANGELOG,CONTRIBUTING,README}.md
    install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE
}
