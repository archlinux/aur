# Maintainer: bipin kumar <kbipinkumar@pm.me>

pkgname=python-pyahocorasick
_module=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc="Fast and memory efficient library for exact or approximate multi-pattern string search"
arch=('x86_64')
url="https://github.com/WojciechMula/pyahocorasick"
license=('custom:BSD-3')
depends=(
         'python'
        )
makedepends=(
             'python-setuptools'
             'cython'
            )

options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
        )
sha256sums=('2985cac6d99c0e9165617fe154b4db0b50c4c2819791c2ad5f0aac0c6a6e58c5')

build() {
    cd "$_module-$pkgver"
    python setup.py build
}

package() {
    cd "$_module-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
