# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Colin Woodbury <colin@fosskers.ca>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=fortls
pkgver=3.2.2
pkgrel=1
pkgdesc="Language Server for Fortran providing code completion, diagnostics, hovering and more."
arch=(any)
url="https://fortls.fortran-lang.org/"
license=("MIT")
depends=("python-json5")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools-scm")
provides=("fortran-language-server")
conflicts=("fortran-language-server")
source=("https://pypi.io/packages/source/f/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b43b2b8cbd447ae848c63b8f008c2df96fd48c3a967b33f6ed64b3421496883b')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # License
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
