pkgname=termtosvg-git
pkgver=0.5.0.r0.g59081f5
pkgrel=1

pkgdesc='record terminal sessions as svg animations'
url='https://github.com/nbedos/termtosvg'
arch=('any')
license=('BSD')

depends=('python-pyte')
makedepends=('git' 'python-setuptools')

provides=('termtosvg')
conflicts=('termtosvg')

source=('git+https://github.com/nbedos/termtosvg')

sha256sums=('SKIP')

pkgver() {
    cd termtosvg
    git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

build() {
    cd termtosvg
    python setup.py build
}

package() {
    cd termtosvg
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm0644 man/termtosvg.md "$pkgdir"/usr/share/doc/"$pkgname"/termtosvg.md
    install -Dm0644 man/termtosvg-template.md "$pkgdir"/usr/share/doc/"$pkgname"/termtosvg-template.md
}
