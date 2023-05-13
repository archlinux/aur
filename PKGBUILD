# Maintainer: bipin kumar <bipin@ccmb.res.in>

pkgname=python-ncls
_module=${pkgname#python-}
pkgver=0.0.67
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
sha256sums=('fa3e673d60e97bb021a516287d74bb959870cf9d910ec82403b99c443d8f447e'
            '48186409eb1721726d28884f40346a8380a893e95a50bef75584e2e9c2d4fcd5')

prepare() {
    cp LICENSE "$_module-$pkgver"
    rm "$_module-$pkgver"/ncls/src/{fncls.c,ncls.c,ncls32.c}
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
