# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-fontmake-git
pkgver=2.4.0.r4.gf9190f1
pkgrel=1
pkgdesc='Compile fonts from sources (UFO, Glyphs) to binary (OpenType, TrueType)'
url='https://github.com/googlefonts/fontmake'
license=('MIT')
arch=('x86_64')
_py_depends=('cu2qu'
             'defcon'
             'fonttools'
             'fontmath'
             'glyphslib'
             'mutatormath'
             'ufolib2'
             'ufo2ft')
depends+=("${_py_deps[@]/#/python-}")
makedepends=('git' 'python-setuptools-scm')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 HEAD |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm755 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

