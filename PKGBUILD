# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=statmake
pkgver=0.3.0
pkgrel=1
pkgdesc='Dump, merge and compile Visual TrueType data in UFO3 with FontTools'
arch=('any')
url="https://github.com/daltonmaag/$pkgname"
license=('MIT')
_py_deps=('attrs'
          'cattrs'
          'fonttools'
          'fs') # optdepends of fonttools required for [ufo]
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('465de5c91f03a6acd58a4e3daa44175a3c5d4c7de6c577da3858ad65ebcde21f')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
