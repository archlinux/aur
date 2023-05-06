# Maintainer: bipin kumar <bipin@ccmb.res.in>

pkgname=python-ncls
_module=${pkgname#python-}
pkgver=0.0.66
pkgrel=2
pkgdesc="A wrapper for the nested containment list data structure"
arch=('x86_64')
url="https://github.com/biocore-ntnu/ncls"
license=('BSD-2')
depends=(
         'python'
         'python-numpy'
         'glibc'
        )
makedepends=(
             'python-setuptools'
             'cython'
             'python-build'
             'python-installer'
             'python-wheel'
            )

options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
        "LICENSE")
sha256sums=('cf65863021b318975bf5a0d17aaa838eef2fa64487fc129c7c78a7f1c94bca36'
            '48186409eb1721726d28884f40346a8380a893e95a50bef75584e2e9c2d4fcd5')

prepare() {
    cp LICENSE "$_module-$pkgver"
    rm "$_module-$pkgver"/ncls/src/{cgraph.c,fncls.c,ncls.c,ncls32.c}
}

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
