# Maintainer: bipin kumar <bipin@ccmb.res.in>

pkgname=python-ncls
_module=${pkgname#python-}
pkgver=0.0.66
pkgrel=1
pkgdesc="A wrapper for the nested containment list data structure"
arch=('x86_64')
url="https://github.com/biocore-ntnu/ncls"
license=('BSD-2')
depends=(
         'python'
         'python-numpy'
        )
makedepends=(
             'python-setuptools'
             'cython'
            )

options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
        "LICENSE")
sha256sums=('cf65863021b318975bf5a0d17aaa838eef2fa64487fc129c7c78a7f1c94bca36'
            '48186409eb1721726d28884f40346a8380a893e95a50bef75584e2e9c2d4fcd5')

prepare() {
    cp LICENSE "$_module-$pkgver"
}

build() {
    cd "$_module-$pkgver"
    python setup.py build
}

package() {
    cd "$_module-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
