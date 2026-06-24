# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>

pkgname=nginx-language-server
pkgver=0.9.0
pkgrel=1
pkgdesc='A Language Server for nginx.conf'
arch=(any)
url='https://github.com/pappasam/nginx-language-server'
license=(GPL-3.0-only)
depends=(
  crossplane
  python
  python-lsprotocol
  python-pydantic
  python-pygls
)
makedepends=(git python-build python-installer python-wheel)
source=("$pkgname::git+$url#tag=v$pkgver"
        "pygls2-compile-fix.patch")
sha512sums=('d4640e9d763fb7549ba1c7744707c7c97da99262e28057fc8a442e0057141c7b76d933bc6bec4616b1f98907cf5f1895f573635dc6514e4324855862c4aa97d5'
            '2b3382c1b66c5045c9989bd29b2aa1d3e55f44f34ca97c12e211f33eb8b901f7114869c8fad13ff800da6682b6e98ffc13c594e40eb6fc58bbcd41270cd2e064')

prepare() {
    patch -d $pkgname -Np1 -i ../pygls2-compile-fix.patch
}

build() {
    cd $pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
}

