# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname='python-pynput'
pkgver=1.7.1
pkgrel=1
_name=pynput
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://github.com/moses-palmer/pynput"
license=('LGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moses-palmer/${_name}/archive/v${pkgver}.tar.gz"
        "python-pynput.patch")
sha512sums=('b2cae6a9eca8b6b76472f15395b5fa12b807faed209bedf70a89817a10e589d62d1bf7cf617f8d92ca6b6685b04728a9e1e9e24a883398a0f2519af44b15ead5'
            'fd25744095c3201335cf601ec7e514f4bb2943de777849b2e821168d4e61098ecc355cfa13eb07ede7c1b91fe63f694a1dd42b13b5d4b8796a593aa5acf908b9')
makedepends=('python-setuptools' 'python-setuptools-lint')
depends=('python-xlib' 'python-six' 'python-evdev')
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
