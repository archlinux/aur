# Maintainer: Falko Galperin <dr (dot) asasteghof (at) gmail (dot) com>
pkgname=python-readabilipy
pkgver=0.2.0
pkgrel=1
pkgdesc="A Python wrapper for Mozilla's Readability.js."
arch=(any)
url="https://github.com/alan-turing-institute/ReadabiliPy"
license=('MIT')
depends=('python>=3.6.0' 'python-beautifulsoup4>=4.7.1' 'python-html5lib' 'python-lxml' 'python-regex')
optdepends=('nodejs>=10.0.0: Readability.js wrapper')
makedepends=('python-setuptools')
changelog=$pkgname.changelog.md
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("098bf347b19f362042fb6c08864ad776588bf844ac2261fb230f7f9c250fdae5")

build() {
    cd "$_name-$pkgver/"
    python setup.py build
}

package() {
    cd "$_name-$pkgver/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    chown root:root -R $pkgdir/usr/lib # fix permissions
}
