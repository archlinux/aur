# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname='python-pynput'
pkgver=1.6.6
pkgrel=1
_name=pynput
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://github.com/moses-palmer/pynput"
license=('LGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moses-palmer/${_name}/archive/v${pkgver}.tar.gz"
        "python-pynput.patch")
sha512sums=('d7b5890377e36413325771628965c0c03807907670e8814ba12f7c8a3542c9cd163c422bd7749f221abfd7b86eb1f294d1224dc4c7cf4dc8e3e95d4d0a1a3665'
            'fd25744095c3201335cf601ec7e514f4bb2943de777849b2e821168d4e61098ecc355cfa13eb07ede7c1b91fe63f694a1dd42b13b5d4b8796a593aa5acf908b9')
makedepends=('python-setuptools' 'python-setuptools-lint')
depends=('python-xlib' 'python-six')
optdepends=('python-sphinx: build online documentation')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    patch -Np1 -i "${srcdir}/python-pynput.patch"
}

build() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build;
}
