# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: bb010g <bb010g@bb010g.com>
pkgname=python-mkdocs-ponylang
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc="Ponylang Material theme for MkDocs"
arch=(any)
url="https://github.com/ponylang/mkdocs-theme"
license=('MIT')
depends=(mkdocs pymdown-extensions python-{pygments,wheel} twine)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "LICENSE")
sha256sums=("26943868f967c3470e08d1576597665c1a4601df1051415afbea6c47adef2e2e"
            "25cc1bdc2b37c209bff6ebb460a75ed30641fd771d5ae0377271fbe884dcb3b6")

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
