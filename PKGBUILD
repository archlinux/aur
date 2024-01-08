# Maintainer: Denis Kasak <dkasak AT termina DOT org DOT uk>

pkgname=graphtage
pkgver=0.3.1
pkgrel=1
pkgdesc="A utility for semantically comparing and merging tree-like structures, such as JSON, XML, HTML, YAML, and CSS files."
arch=('any')
url=https://github.com/trailofbits/graphtage
license=('LGPLv3')
depends=('python' 'python-colorama' 'python-intervaltree' 'python-json5>=0.9.5'
         'python-yaml' 'python-scipy>=1.4.0' 'python-tqdm'
         'python-typing_extensions>=3.6.5')
makedepends=('python-setuptools')
source=(https://github.com/trailofbits/graphtage/archive/v${pkgver}.tar.gz)
sha256sums=('0eb5b3a35488b04ac350204499f3745d82c18afc2de1ff80c3cb1919e1a7913a')

prepare() {
    # disable Python pickle support
    sed -i -E 's/\s+"fickling.*".*$/#&/' ${srcdir}/graphtage-${pkgver}/setup.py
    sed -i 's/ pickle,//' ${srcdir}/graphtage-${pkgver}/graphtage/__init__.py
}

build() {
    cd "$srcdir/$pkgname-$pkgver/"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver/"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=4:sw=4:et:
